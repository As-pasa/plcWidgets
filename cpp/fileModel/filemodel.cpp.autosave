#include "filemodel.h"

FileModel::FileModel(ScreenController* controller, IFileSystem *sys,QString innerFileDir,  QObject *parent) : QObject(parent)
{
     m_system=sys;
     m_localCodesys=innerFileDir;
     m_devices.append(SaveDeviceEntry("CD card", "/run/media/mmcblk1p1/", m_system));
     //m_devices.append(SaveDeviceEntry("USB device", "B:/coding/matemp/usbStorage", m_system));
     m_controller=controller;
     refreshDevices();



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

QStringList FileModel::detectedFiles()
{
    auto a =getfoldersInDevice(m_selectedDevice);
    emit detectedFilesChanged(a);
    return a;

}

void FileModel::refreshDevices()
{
    QStringList ans= detectedDevices();
    emit detectedDevicesChanged(ans);
}

void FileModel::copyTo(QString deviceName,QString path)
{

    foreach (auto dev, m_devices) {
        if(dev.getName()==deviceName){

            if(!dev.isOnline()){
                m_controller->showInfoWithText( QString("device (%1) not mounted. Unable to save").arg(dev.getName()));
                return;
            }
            else{

                QString pathWithStamp =dev.getPath()+ QDir::separator()+path;
                m_system->copyAll(m_localCodesys, pathWithStamp);
                 m_controller->showInfoWithText("saved with stamp: "+path);
                return;
            }
            break;
        }
    }
     m_controller->showInfoWithText(QString("device (%1) not founded").arg(deviceName));
}

void FileModel::copyFrom(QString device, QString saveName)
{
   innerCopyFrom(device,saveName);
}

void FileModel::innerCopyFrom(QString device, QString saveName)
{
    foreach (auto dev, m_devices) {
        if(dev.getName()==device){
            if(!dev.isOnline()){
               m_controller->showInfoWithText(QString("device (%1) not mounted. Unable to save").arg(dev.getName()));
               return;
            }
            if(!dev.getEntries().contains(saveName)){
                   m_controller->showInfoWithText(QString("file (%1) not found on device. Unable to save").arg(saveName));
                  return;
            }
            QString path=QDir::cleanPath(dev.getPath()+QDir::separator()+saveName);
            QDir a(m_localCodesys);
            if(!a.exists()){
                 m_controller->showInfoWithText(QString("codeSys folder not found on specified path"));
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
     m_controller->showInfoWithText(QString("could not found device / savename specified: (%1/%2)").arg(device,saveName));
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

QString FileModel::selectedDevice()
{
    return m_selectedDevice;
}

void FileModel::setSelectedDevice(QString a)
{
    m_selectedDevice=a;
    emit selectedDeviceChanged(m_selectedDevice);

}





