#ifndef DEBUGFILESYSTEM_H
#define DEBUGFILESYSTEM_H

#include "ifilesystem.h"
#include <QDebug>
class DebugFileSystem
{



public:
    void copyAll(QString from, QString to);
    bool exists(QString Path);
};

#endif // DEBUGFILESYSTEM_H
