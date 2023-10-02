#include "timemodel.h"

TimeModel::TimeModel(DebugTimeSystem *system)
{
    m_system=system;
    m_timer=new QTimer(this);
    current=this->m_system->getCurrentTime();
    connect(m_timer, &QTimer::timeout,this, [=](){
        current= current.addSecs(60);
        emit currentTimeChanged(current);
    });
    m_timer->start(1000);
}

QDateTime TimeModel::currentTime(){

    return current;


};
void TimeModel::setCurrentTime(QDateTime nTime){
    if(nTime!=this->currentTime()){
        int nyear, nmonth,nday,nminute,nhour;


        nTime.date().getDate(&nyear,&nmonth,&nday);
        nminute=nTime.time().minute();
        nhour=nTime.time().hour();

        int cyear,cmonth,cday,cminute,chour;
        auto cur=this->currentTime();
        cur.date().getDate(&cyear,&cmonth,&cday);
        cminute=cur.time().minute();
        chour=cur.time().hour();

        if(nyear==cyear && nmonth==cmonth && nday==cday && nhour==chour && qFabs(nminute-cminute)<=1){
            return;

        }
        m_system->setTime(nTime);
        current=m_system->getCurrentTime();
        emit currentTimeChanged(nTime);
    }

}

QStringList TimeModel::timeZones()
{
    if(m_timeZones.size()==0){
        for(const auto& id: QTimeZone::availableTimeZoneIds()){
            QTimeZone tz(id);

            m_timeZones.append(QString("(%1) %2").arg(tz.displayName(QTimeZone::StandardTime,QTimeZone::OffsetName),QString(id)) );
            if(id==QTimeZone::systemTimeZoneId()){

                m_currentTimeZone=m_timeZones[m_timeZones.size()-1];
            }
        }
        qDebug()<<QTimeZone::systemTimeZoneId();
    }

    return m_timeZones;
}

QString TimeModel::currentTimeZone()
{
    if(m_currentTimeZone==""){
        timeZones();
    }
    return m_currentTimeZone;
}

void TimeModel::setCurrentTimeZone(QString n)
{
    qDebug()<<"time zone selected";
    m_currentTimeZone=n;
    emit currentTimeZoneChanged(n);
};

bool TimeModel::NIPStatus(){
    return m_system->NIP;
};
void TimeModel::setNIPStatus(bool enabled){
    m_system->setNipEnabled(enabled);
    emit NIPStatusChanged(enabled);
};

bool TimeModel::ATZStatus(){
    return m_system->ATZ;

};
void TimeModel::setATZStatus(bool status){
    m_system->setAtzEnabled(status);
    emit ATZStatusChanged(status);
}

void TimeModel::installCurrentTimeZoneAsSystem()
{
    qDebug()<<"timezone was setted";
};
