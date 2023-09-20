#ifndef PLTIMESYSTEM_H
#define PLTIMESYSTEM_H

#include "itimesystem.h"
#include "utilities/os.h"
class PLCTimeSystem:public ITimeSystem
{
public:
    PLCTimeSystem();

    // ITimeSystem interface
public:
    void setTime(TimeChangePackage package);
    void setAtzEnabled(bool enabled);
    void setNipEnabled(bool enabled);
    void setSystemClockToHardware();
    QDateTime getCurrentTime();
};

#endif // PLTIMESYSTEM_H
