#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QObject>
#include "ifilesystem.h"
#include "savedeviceentry.h"
#include "filesystemtimestamper.h"
#include <QDebug>
#include <QDir>
#include <QStringList>
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/utilities/confirmationDisplayer/commandconfirmator.h"
class FileModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList detectedDevices READ detectedDevices NOTIFY detectedDevicesChanged)
    Q_PROPERTY(QString selectedDevice READ selectedDevice NOTIFY selectedDeviceChanged)
    Q_PROPERTY(QStringList detectedFiles READ detectedFiles NOTIFY detectedFilesChanged)
public:
    explicit FileModel(ScreenController* controller, IFileSystem *sys,QString innerFileDir, QObject *parent = nullptr);

private:
    QList<SaveDeviceEntry> m_devices;
    FileSystemTimeStamper m_stamper;
    IFileSystem* m_system;
    QString m_localCodesys;
    QStringList detectedDevices();
    QStringList detectedFiles();
    ScreenController* m_controller;

    QString m_selectedDevice;


public slots:
    void refreshDevices();
    void copyTo(QString deviceName, QString path);
    void copyFrom(QString device, QString saveName);
    void innerCopyFrom(QString device,QString saveName);
    QStringList getfoldersInDevice(QString device);
    QString selectedDevice();
    void setSelectedDevice(QString);
signals:
    void detectedDevicesChanged(QStringList);
    void selectedDeviceChanged(QString);
    void detectedFilesChanged(QStringList);
};




#endif // FILEMODEL_H
