#ifndef PLTIMESYSTEM_H
#define PLTIMESYSTEM_H

#include "itimesystem.h"
#include "../utilities/os.h"
#include <QFile>
#include <QTimeZone
#include <QDebug>
#include "cpp/utilities/mylogger.h"
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
public:            qDebug()<<tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName);us();
    bool getNIPStatus();

    // ITimeSystem interface
public:
    QStringList getTimeZones();

    // ITimeSystem interface
public:
    QString getCurrentTimeZone();
};

#endif // PLTIMESYSTEM_H
