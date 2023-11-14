#include "debugtimesystem.h"

DebugTimeSystem::DebugTimeSystem()
{
    ATZ=false;
    NIP=true;
}

void DebugTimeSystem::setTime(TimeChangePackage package)
{

    qDebug()<<"system time changed";


    if(package.dateChanged)cur.setDate(package.date);
    if(package.timeChanged)cur.setTime(package.time);
    if(package.timeZoneChanged)currentTimeZone=package.timeZone; qDebug()<<"time zone setted";
    qDebug()<<cur.toString();
}


void DebugTimeSystem::setAtzEnabled(bool enabled)
{
    qDebug()<<"Atz status setted: "<<enabled;
    ATZ=enabled;
}

void DebugTimeSystem::setNipEnabled(bool enabled)
{
    qDebug()<<"Nip status setted: "<<enabled;
    NIP=enabled;
}

bool DebugTimeSystem::getATZStatus()
{
    return ATZ;
}

bool DebugTimeSystem::getNIPStatus()
{
    return NIP;
}

QDateTime DebugTimeSystem::getCurrentTime()
{
    qDebug()<<cur.toString();
    return cur;
}

QStringList DebugTimeSystem::getTimeZones()
{
    QStringList ans;
    for(const auto& id: QTimeZone::availableTimeZoneIds()){
        QTimeZone tz(id);
        ans.append(QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(id)) );

    }
    return ans;
}

QString DebugTimeSystem::getCurrentTimeZone()
{
    if(currentTimeZone==""){
        for(const auto& id: QTimeZone::availableTimeZoneIds()){
            if(id==QTimeZone::systemTimeZoneId()){
                QTimeZone tz(id);
                currentTimeZone=QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(id));
            }
        }
    }
    return currentTimeZone;

}
