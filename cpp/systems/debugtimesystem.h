#ifndef DEBUGTIMESYSTEM_H
#define DEBUGTIMESYSTEM_H


#include "itimesystem.h"
#include <QDebug>
class DebugTimeSystem:public ITimeSystem
{

public:
    DebugTimeSystem();

    // ITimeSystem interface
public:
    void setTime(TimeChangePackage package);
    void setAtzEnabled(bool enabled);
    void setNipEnabled(bool enabled);
    QDateTime getCurrentTime();
};

#endif // DEBUGTIMESYSTEM_H
