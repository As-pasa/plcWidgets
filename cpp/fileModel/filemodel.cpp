#include "filemodel.h"

FileModel::FileModel(MessageDisplayer* displayer,IFileSystem *sys,QString innerFileDir,  QObject *parent) : QObject(parent)
{
     m_system=sys;
     m_localCodesys=innerFileDir;
     m_devices.append(SaveDeviceEntry("CD card", "B:/coding/matemp/cdStorage", m_system));
     m_devices.append(SaveDeviceEntry("USB device", "B:/coding/matemp/usbStorage", m_system));
     refreshDevices();
     m_displayer=displayer;
}

QStringList FileModel::detectedDevices()
{
    QStringList ans;

    foreach (SaveDeviceEntry entry, m_devices) {

            if(entry.isOnline()){

                ans.append(entry.getName());
            }
    }
    return ans;
}

void FileModel::refreshDevices()
{
    QStringList ans= detectedDevices();
    emit detectedDevicesChanged(ans);
}

bool FileModel::copyTo(QString deviceName)
{

    foreach (auto dev, m_devices) {
        if(dev.getName()==deviceName){

            if(!dev.isOnline()){
                return false;
            }
            else{
                QString stamp=m_stamper.getStamp();
                QString pathWithStamp =dev.getPath()+ QDir::separator()+stamp;
                m_system->copyAll(m_localCodesys, pathWithStamp);
                m_displayer->showMessage("saved with stamp: "+stamp);
                return true;
            }
            break;
        }
    }
    return false;
}

bool FileModel::copyFrom(QString device, QString saveName)
{
    foreach (auto dev, m_devices) {
        if(dev.getName()==device){
            if(!dev.isOnline()){
                return false;
            }
            if(!dev.getEntries().contains(saveName)){
                return false;
            }
            QString path=QDir::cleanPath(dev.getPath()+QDir::separator()+saveName);
            QDir a(m_localCodesys);

            foreach (QString file, a.entryList(QDir::NoDotAndDotDot|QDir::Hidden  | QDir::AllDirs | QDir::Files)) {
                QString pp=QDir::cleanPath(a.absoluteFilePath(file));
                QFileInfo fileInfo(pp);
                if(fileInfo.isDir()){
                    QDir(pp).removeRecursively();
                }
                else{

                    QFile(pp).remove();
                }
            }

            m_system->copyAll(path,m_localCodesys);
            return true;

            break;
        }
    }
    return false;
}

QStringList FileModel::getfoldersInDevice(QString device)
{
    foreach (auto dev, m_devices) {
        if(dev.getName()==device){
            if(!dev.isOnline()){
                return QStringList();
            }
            else{
                return dev.getEntries();
            }
            break;
        }
    }
    return QStringList();
}



