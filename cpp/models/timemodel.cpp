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
};
