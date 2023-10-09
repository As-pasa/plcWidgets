#include "debugtimesystem.h"

DebugTimeSystem::DebugTimeSystem()
{

}

void DebugTimeSystem::setTime(QDateTime package)
{
    qDebug()<<cur;
    qDebug()<<"system time changed";

    cur=package;
    qDebug()<<cur;
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
