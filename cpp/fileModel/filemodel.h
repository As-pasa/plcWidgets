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
#include "cpp/utilities/confirmationDisplayer/commandconfirmator.h"
class FileModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList detectedDevices READ detectedDevices NOTIFY detectedDevicesChanged)
    Q_PROPERTY(QString selectedDevice READ selectedDevice NOTIFY selectedDeviceChanged)
    Q_PROPERTY(QStringList detectedFiles READ detectedFiles NOTIFY detectedFilesChanged)
public:
    explicit FileModel(MessageDisplayer* displayer,CommandConfirmator* confirmator, IFileSystem *sys,QString innerFileDir, QObject *parent = nullptr);

private:
    QList<SaveDeviceEntry> m_devices;
    FileSystemTimeStamper m_stamper;
    IFileSystem* m_system;
    QString m_localCodesys;
    QStringList detectedDevices();
    QStringList detectedFiles();
    MessageDisplayer* m_displayer;
    CommandConfirmator* m_confirmator;
    QString m_selectedDevice;
    class ImportConfirm:public Confirmable{
        // Confirmable interface
        private:
            FileModel * m_model;
            QString m_device;
            QString m_saveFile;

        public:

            ImportConfirm(FileModel *model, QString device, QString saveName);
            QString getDescription();
            void accept();
    };

public slots:
    void refreshDevices();
    void copyTo(QString path);
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
