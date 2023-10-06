#ifndef IFILESYSTEM_H
#define IFILESYSTEM_H

#include <QString>
class IFileSystem
{
public:
    virtual void copySelected(QString from, QString to,QStringList files)=0;
    virtual void copyAll(QString from, QString to)=0;
    virtual QStringList fileList(QString dir, bool recursive)=0;
    virtual int getInnerTotalMB()=0;
    virtual int getInnerUsedMB()=0;
    virtual int getOuterTotalMB(bool &isOuterMounted)=0;
    virtual int getOuterUsedMB(bool &isOuterMounted)=0;
};

#endif // IFILESYSTEM_H
