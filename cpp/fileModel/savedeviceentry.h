#ifndef SAVEDEVICEENTRY_H
#define SAVEDEVICEENTRY_H

#include <QObject>
#include "ifilesystem.h"
class SaveDeviceEntry
{
    QString m_name;
    QString m_path;
    IFileSystem* m_system;
public:
    SaveDeviceEntry(QString name, QString path,IFileSystem* system);
    QString getName();
    QString getPath();
    QStringList getEntries();
    bool isOnline();

};

#endif // SAVEDEVICEENTRY_H
