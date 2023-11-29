#ifndef PLTIMESYSTEM_H
#define PLTIMESYSTEM_H

#include "itimesystem.h"
#include "../utilities/os.h"
#include <QFile>
#include <QTimeZone>
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

    // ITimeSystem interface
public:
    bool getATZStatus();
    bool getNIPStatus();

    // ITimeSystem interface
public:
    QStringList getTimeZones();

    // ITimeSystem interface
public:
    QString getCurrentTimeZone();
};

#endif // PLTIMESYSTEM_H
