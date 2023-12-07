#include "filemodel.h"

FileModel::FileModel(MessageDisplayer* displayer,CommandConfirmator* confirmator, IFileSystem *sys,QString innerFileDir,  QObject *parent) : QObject(parent)
{
     m_system=sys;
     m_localCodesys=innerFileDir;
     m_devices.append(SaveDeviceEntry("CD card", "/run/media/mmcblk1p1/", m_system));
     //m_devices.append(SaveDeviceEntry("USB device", "B:/coding/matemp/usbStorage", m_system));
     refreshDevices();
     m_displayer=displayer;
     m_confirmator=confirmator;
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

void FileModel::copyTo(QString deviceName)
{

    foreach (auto dev, m_devices) {
        if(dev.getName()==deviceName){

            if(!dev.isOnline()){
                m_displayer->showMessage(QString("device (%1) not mounted. Unable to save").arg(dev.getName()));
                return;
            }
            else{
                QString stamp=m_stamper.getStamp();
                QString pathWithStamp =dev.getPath()+ QDir::separator()+stamp;
                m_system->copyAll(m_localCodesys, pathWithStamp);
                m_displayer->showMessage("saved with stamp: "+stamp);
                return;
            }
            break;
        }
    }
    m_displayer->showMessage(QString("device (%1) not founded").arg(deviceName));
}

void FileModel::copyFrom(QString device, QString saveName)
{
    auto a =new ImportConfirm(this,device,saveName);
    m_confirmator->enqueue(a);
}

void FileModel::innerCopyFrom(QString device, QString saveName)
{
    foreach (auto dev, m_devices) {
        if(dev.getName()==device){
            if(!dev.isOnline()){
               m_displayer->showMessage(QString("device (%1) not mounted. Unable to save").arg(dev.getName()));
               return;
            }
            if(!dev.getEntries().contains(saveName)){
                  m_displayer->showMessage(QString("file (%1) not found on device. Unable to save").arg(saveName));
                  return;
            }
            QString path=QDir::cleanPath(dev.getPath()+QDir::separator()+saveName);
            QDir a(m_localCodesys);
            if(!a.exists()){
                m_displayer->showMessage(QString("codeSys folder not found on specified path"));
                return;
            }
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
            return;

            break;
        }
    }
    m_displayer->showMessage(QString("could not found device / savename specified: (%1/%2)").arg(device,saveName));
    return;
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





FileModel::ImportConfirm::ImportConfirm(FileModel *model, QString device, QString saveName)
{
    m_model=model;
    m_device=device;
    m_saveFile=saveName;
}

QString FileModel::ImportConfirm::getDescription()
{
    return "All inner files will be deleted. Continue?";
}

void FileModel::ImportConfirm::accept()
{
    m_model-> innerCopyFrom(m_device,m_saveFile);
}
