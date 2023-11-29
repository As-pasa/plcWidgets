#ifndef PLCFILESYSTEM_H
#define PLCFILESYSTEM_H
#include "ifilesystem.h"
#include <QFileInfo>

#include <QDir>
#include <QDebug>
class PlcFileSystem : public IFileSystem
{
public:
    PlcFileSystem();

    // IFileSystem interface
public:
    void copyAll(QString from, QString to);
    bool exists(QString Path);
    QStringList getFolderContent(QString folder);
};

#endif // PLCFILESYSTEM_H
