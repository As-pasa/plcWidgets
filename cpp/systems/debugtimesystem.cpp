#include "debugtimesystem.h"

DebugTimeSystem::DebugTimeSystem()
{

}

void DebugTimeSystem::setTime(TimeChangePackage package)
{
    qDebug()<<"system time changed";

}


void DebugTimeSystem::setAtzEnabled(bool enabled)
{
    qDebug()<<"Atz status setted: "<<enabled;
}

void DebugTimeSystem::setNipEnabled(bool enabled)
{
    qDebug()<<"Nip status setted: "<<enabled;
}

QDateTime DebugTimeSystem::getCurrentTime()
{
    qDebug()<<"current time requested";
    return QDateTime::currentDateTime();
}
