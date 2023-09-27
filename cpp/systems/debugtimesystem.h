#ifndef DEBUGTIMESYSTEM_H
#define DEBUGTIMESYSTEM_H


#include "itimesystem.h"
#include <QDebug>
class DebugTimeSystem
{

public:
    DebugTimeSystem();
     bool NIP;
     bool ATZ;
     QDateTime cur=QDateTime::currentDateTime();
    // ITimeSystem interface
public:
    void setTime(QDateTime package);
    void setAtzEnabled(bool enabled);
    void setNipEnabled(bool enabled);
    bool getATZStatus();
    bool getNIPStatus();
    QDateTime getCurrentTime();
};

#endif // DEBUGTIMESYSTEM_H
