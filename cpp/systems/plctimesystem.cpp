#include "plctimesystem.h"

PLCTimeSystem::PLCTimeSystem()
{

}

void PLCTimeSystem::setTime(TimeChangePackage package)
{

    const QString setTimeTempl("timedatectl set-time \"%1\"");
    const QString setTZTempl("timedatectl set-timezone %1");

    if(package.timeChanged || package.dateChanged)

    {
        auto dt = QDateTime::currentDateTime();
        if(package.timeChanged) dt.setTime(package.time);
        if(package.dateChanged) dt.setDate(package.date);
        os::System2("timedatectl", {" set-time", dt.toString(" yyyy-MM-dd hh:mm:ss")}, true);

    }

    if(package.timeZoneChanged)
    {
        os::System(setTZTempl.arg(QString(package.timeZone)), true);
    }

}

void PLCTimeSystem::setAtzEnabled(bool enabled)
{
    if(enabled){
        os::System("systemctl enable auto-tz.service", true);
    }
    else{
       os::System("systemctl disable auto-tz.service", true);
    }
}

void PLCTimeSystem::setNipEnabled(bool enabled)
{
    if(enabled){
        os::System("systemctl enable systemd-timesyncd.service", true);
    }
    else{
        os::System("systemctl disable systemd-timesyncd.service", true);
    }
}

void PLCTimeSystem::setSystemClockToHardware()
{
    os::System(" hwclock -w", true);
}

QDateTime PLCTimeSystem::getCurrentTime()
{
    return QDateTime::currentDateTime();
}
