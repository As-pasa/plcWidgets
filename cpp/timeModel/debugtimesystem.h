#ifndef DEBUGTIMESYSTEM_H
#define DEBUGTIMESYSTEM_H


#include "itimesystem.h"
#include <QDebug>
#include <QTimeZone>
class DebugTimeSystem:ITimeSystem
{

public:
    DebugTimeSystem();
     bool NIP;
     bool ATZ;
     QDateTime cur=QDateTime::currentDateTime();
     QString currentTimeZone;



     // ITimeSystem interface
public:
     void setTime(TimeChangePackage package);
     void setAtzEnabled(bool enabled);
     void setNipEnabled(bool enabled);
     bool getATZStatus();
     bool getNIPStatus();
     QDateTime getCurrentTime();

     // ITimeSystem interface
public:
     QStringList getTimeZones();

     // ITimeSystem interface
public:
     QString getCurrentTimeZone();
};

#endif // DEBUGTIMESYSTEM_H
