#ifndef DEBUGFILESYSTEM_H
#define DEBUGFILESYSTEM_H

#include "ifilesystem.h"
#include <QDebug>
class DebugFileSystem: public IFileSystem
{
public:
    DebugFileSystem();


    // IFileSystem interface
public:
    void copySelected(QString from, QString to, QStringList files);
    void copyAll(QString from, QString to);
    QStringList fileList(QString dir, bool recursive);
    int getInnerTotalMB();
    int getInnerUsedMB();
    int getOuterTotalMB(bool &isOuterMounted);
    int getOuterUsedMB(bool &isOuterMounted);
};

#endif // DEBUGFILESYSTEM_H
