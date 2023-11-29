#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QObject>
#include "ifilesystem.h"
#include "savedeviceentry.h"
#include "filesystemtimestamper.h"
#include <QDebug>
#include <QDir>
#include <QStringList>
#include "cpp/utilities/messagedisplayer.h"

class FileModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList detectedDevices READ detectedDevices NOTIFY detectedDevicesChanged)

public:
    explicit FileModel(MessageDisplayer* displayer, IFileSystem *sys,QString innerFileDir, QObject *parent = nullptr);

private:
    QList<SaveDeviceEntry> m_devices;
    FileSystemTimeStamper m_stamper;
    IFileSystem* m_system;
    QString m_localCodesys;
    QStringList detectedDevices();
    MessageDisplayer* m_displayer;


public slots:
    void refreshDevices();
    bool copyTo(QString path);
    bool copyFrom(QString device, QString saveName);
    QStringList getfoldersInDevice(QString device);
signals:
    void detectedDevicesChanged(QStringList);
    void savedWithStamp(QString);

};

#endif // FILEMODEL_H
