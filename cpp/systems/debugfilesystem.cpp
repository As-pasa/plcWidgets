#include "debugfilesystem.h"

DebugFileSystem::DebugFileSystem()
{

}

void DebugFileSystem::copySelected(QString from, QString to, QStringList files)
{
   qDebug()<<"copied "<<files;
   qDebug()<<"from "<<from << "to "<<to;
}

void DebugFileSystem::copyAll(QString from, QString to)
{
    qDebug()<<"Copied all";
    qDebug()<<"from "<< from <<"to"<<to;
}

QStringList DebugFileSystem::fileList(QString dir, bool recursive)
{
    qDebug()<<"file list requested";
    return QStringList {"Aaaa","Bbbbb","Ccccc","Dddddd"};
}

int DebugFileSystem::getInnerTotalMB()
{
    return 200;
}

int DebugFileSystem::getInnerUsedMB()
{
    return 50;
}

int DebugFileSystem::getOuterTotalMB(bool &isOuterMounted)
{
    return 800;
}

int DebugFileSystem::getOuterUsedMB(bool &isOuterMounted)
{
    return 300;
}
