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
        os::System(setTZTempl.arg(package.timeZone), true);
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

bool PLCTimeSystem::getATZStatus()
{
    bool status=false;
    QFile atz;
    atz.setFileName("/etc/systemd/system/multi-user.target.wants/auto-tz.service");
    if(!atz.open(QIODevice::ReadOnly)){status=false;}
    else{status = true;}
    atz.close();
    return status;
}

bool PLCTimeSystem::getNIPStatus()
{
    bool status=false;
    QFile nip;
    nip.setFileName("/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service");
    if(!nip.open(QIODevice::ReadOnly)){
        status=false;
    }
    else {status=true;}
    nip.close();
    return status;

}

QStringList PLCTimeSystem::getTimeZones()
{
    QStringList ans;
    for(const auto& id: QTimeZone::availableTimeZoneIds()){
        QTimeZone tz(id);
        ans.append(QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(id)) );
    }
    return ans;
}

QString PLCTimeSystem::getCurrentTimeZone()
{
    QString ans;
    for(const auto& id: QTimeZone::availableTimeZoneIds()){


        if(id==QTimeZone::systemTimeZoneId()){
            QTimeZone tz(id);
            ans=QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(id));
        }
    }
    return ans;

}
