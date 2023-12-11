#include "timemodel.h"

TimeModel::TimeModel(ITimeSystem *system)
{
    m_system=system;
    m_timer=new QTimer(this);
    m_currentDT=this->m_system->getCurrentTime();
    connect(m_timer, &QTimer::timeout,this, [=](){
        m_currentDT= m_currentDT.addSecs(60);
        emit currentTimeChanged(m_currentDT);
    });
    m_timer->start(1000*60);

    m_NipStatus=m_system->getNIPStatus();
    m_ATZStatus=m_system->getATZStatus();
}

QDateTime TimeModel::currentTime(){
    return m_currentDT;
};
void TimeModel::setCurrentTime(QDateTime nTime){
    MyLogger::log("timeModel","set current time started");

    if(nTime!=this->currentTime()){
        int nyear, nmonth,nday,nminute,nhour;
        MyLogger::log("timeModel","time not equal current. changing time from "+this->currentTime().toString()+" to "+nTime.toString());
        nTime.date().getDate(&nyear,&nmonth,&nday);
        nminute=nTime.time().minute();
        nhour=nTime.time().hour();

        int cyear,cmonth,cday,cminute,chour;
        auto cur=this->currentTime();
        cur.date().getDate(&cyear,&cmonth,&cday);
        cminute=cur.time().minute();
        chour=cur.time().hour();

        if(nyear==cyear && nmonth==cmonth && nday==cday && nhour==chour && qFabs(nminute-cminute)<=1){
            MyLogger::warn("timeModel","time is considered equal to current. breaking");
            return;
        }
        TimeChangePackage p(nTime.time(),nTime.date(),"",true,true,false);
        MyLogger::log("timeModel","time package constructed."+nTime.time().toString()+" "+nTime.date().toString());
        m_system->setTime(p);

        m_currentDT=m_system->getCurrentTime();
        MyLogger::log("timeModel","current time setted."+m_currentDT.toString());
        emit currentTimeChanged(nTime);
    }

}

void TimeModel::setTimeZone(QString n)
{
    setCurrentTimeZone(n);
}

QStringList TimeModel::timeZones()
{
    if(m_timeZones.size()==0){
        m_timeZones=m_system->getTimeZones();
    }
    return m_timeZones;
}

QString TimeModel::currentTimeZone()
{
    
    m_currentTimeZone= m_system->getCurrentTimeZone();
    
    return m_currentTimeZone;
}

void TimeModel::setCurrentTimeZone(QString n)
{
    if(n!=m_currentTimeZone){
        MyLogger::log("timeModel",QString("changing time zone: was (%1) become (%2)").arg(m_currentTimeZone, n) );
        m_system->setTime(TimeChangePackage(currentTime().time(), currentTime().date(),n ,false,false,true));
        m_currentTimeZone=m_system->getCurrentTimeZone();
        MyLogger::log("timeModel","time zone read from system, equals: "+m_currentTimeZone);

        emit currentTimeZoneChanged(n);

    }
};

bool TimeModel::NIPStatus(){

    return m_NipStatus;
};
void TimeModel::setNIPStatus(bool status){
    if(status!=m_NipStatus){

        m_NipStatus=status;
        m_system->setNipEnabled(status);
        emit NIPStatusChanged(status);
        emit currentTimeChanged(currentTime());
    }

};

bool TimeModel::ATZStatus(){
    return m_ATZStatus;

};
void TimeModel::setATZStatus(bool status){
    if(status!=m_ATZStatus){
        MyLogger::log("timeModel","atz status changing");
        m_ATZStatus=status;
        m_system->setAtzEnabled(status);

        emit ATZStatusChanged(status);
        MyLogger::log("timeModel","signal emitted: atz status changed");
        m_currentTimeZone=currentTimeZone();
        MyLogger::log("timeModel","current time zone: "+m_currentTimeZone);
        emit currentTimeZoneChanged(m_currentTimeZone);
        MyLogger::log("timeModel","signal emitted: current time zone changed");
    }

}

void TimeModel::installCurrentTimeZoneAsSystem()
{
    qDebug()<<"timezone was setted";
};
