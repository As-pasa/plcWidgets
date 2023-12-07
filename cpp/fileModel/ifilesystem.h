#ifndef IFILESYSTEM_H
#define IFILESYSTEM_H

#include <QString>
class IFileSystem
{
public:
    virtual void copyAll(QString from, QString to)=0;
    virtual bool exists(QString Path)=0;
    virtual QStringList getFolderContent(QString)=0;
};

#endif // IFILESYSTEM_H
