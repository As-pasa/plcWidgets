#include "plctimesystem.h"

PLCTimeSystem::PLCTimeSystem()
{

}

void PLCTimeSystem::setTime(TimeChangePackage package)
{

    const QString setTimeTempl("timedatectl set-time \"%1\"");
    const QString setTZTempl("timedatectl set-timezone  %1 ");

    if(package.timeChanged || package.dateChanged)

    {
        MyLogger::log("TimeSystem","time changed. package: "+package.time.toString()+" "+ package.date.toString());
        qDebug()<<"time changed";
        auto dt = QDateTime::currentDateTime();
        if(package.timeChanged) dt.setTime(package.time);
        if(package.dateChanged) dt.setDate(package.date);
        QStringList a;
        a.append("set-time");
        a.append(dt.toString(" yyyy-MM-dd hh:mm:ss"));
        MyLogger::log("TimeSystem","os command result "+ QString::number( os::System2("timedatectl", a, true))) ;

    }

    if(package.timeZoneChanged)
    {
        QStringList a;
        a.append("set-timezone");
        a.append(package.timeZone.split(" ")[1]);
        MyLogger::log("TimeSystem","os command result "+ QString::number(os::System2("timedatectl",a, true)));

    }
}

void PLCTimeSystem::setAtzEnabled(bool enabled)
{
    MyLogger::log("timeSystem","atz set started");
    QStringList a("");
    if(enabled){
        os::System2("auto-tz",a,true);
        os::System("systemctl enable auto-tz.service", true);
        MyLogger::log("timeSystem","atz enabled");
    }
    else{
        MyLogger::log("timeSystem","atz disabled");
       os::System("systemctl disable auto-tz.service", true);
    }
}

void PLCTimeSystem::setNipEnabled(bool enabled)
{
    if(enabled){
        QStringList a;
        a.append("set-ntp");
        a.append("true");
        os::System2("timedatectl",a,true);
        os::System("systemctl enable systemd-timesyncd.service", true);
    }
    else{
        QStringList a;
        a.append("set-ntp");
        a.append("false");
        os::System2("timedatectl",a,true);
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
    QString a="";
    auto x= os::readFromFile("/etc/systemd/system/multi-user.target.wants/auto-tz.service",a);
    MyLogger::log("timeSystem","data from atz file"+x);
    return x;
}

bool PLCTimeSystem::getNIPStatus()
{
    QString a="";
    return os::readFromFile("/etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service",a);
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
    QString out;
    os::System2("timedatectl | grep \"Time zone\"",QStringList(),true,&out);
    out=out.split(" ")[2];
    MyLogger::log("timeSystem","current time zone got from timedatectl utility: "+out);
    QString ans;
    MyLogger::log("timeSystem","current time zone search started");
    auto zz=QTimeZone::systemTimeZoneId();
    QTimeZone tz(zz);
    ans=QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(zz));
    MyLogger::log("timeSystem","time zone founded "+ans);
    return ans;

}
