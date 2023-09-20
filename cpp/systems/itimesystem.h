#ifndef ITIMESYSTEM_H
#define ITIMESYSTEM_H

#include <QDateTime>
#include "../models/timechangepackage.h"
class ITimeSystem
{
public:
    ITimeSystem();
    virtual void setTime(TimeChangePackage package)=0;
    virtual void setAtzEnabled(bool enabled)=0;
    virtual void setNipEnabled(bool enabled)=0;
    virtual QDateTime getCurrentTime()=0;
};

#endif // ITIMESYSTEM_H
