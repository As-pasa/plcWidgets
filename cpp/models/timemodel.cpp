#include "timemodel.h"

TimeModel::TimeModel(ITimeSystem *system)
{
    m_system=system;
    m_NipStatus=false;
    m_AtzStatus=false;
}

QDateTime TimeModel::getCurrentTime()
{
    return m_system->getCurrentTime();
}

bool TimeModel::getNipStatus()
{
    return m_NipStatus;
}

bool TimeModel::getAtzStatus()
{
    return m_AtzStatus;
}

void TimeModel::setNipStatus(bool enabled)
{
    if(enabled!=m_NipStatus){
        m_NipStatus=enabled;
        m_system->setNipEnabled(m_NipStatus);
        emit NipStatusChanged(m_NipStatus);
    }
}

void TimeModel::setAtzStatus(bool enabled)
{
    if(enabled!=m_AtzStatus){
        m_AtzStatus=enabled;
        m_system->setAtzEnabled(m_AtzStatus);
        emit AtzStatusChanged(m_AtzStatus);
    }
}

void TimeModel::setTime(TimeChangePackage package)
{
    m_system->setTime(package);
    emit TimeChanged(QDateTime(package.date,package.time));
}

