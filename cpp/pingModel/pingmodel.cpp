#include "pingmodel.h"

PingModel::PingModel(MessageDisplayer* displayer,IPingSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
    m_displayer=displayer;
}

QString PingModel::ping(QString ip)
{
   return m_system->getPingResult(ip);
}


//void PingModel::startPing(QString ip){

//    lastPingResult= m_system->getPingResult(ip);
//    MyLogger::log("pingModel","ping execution ended. answer: "+lastPingResult);
//    //m_displayer->showMessage(lastPingResult);

//    MyLogger::log("pingModel","ping execution ended signal emitted");

//}




//QString PingModel::getPingResult(){
//    return lastPingResult;

//}

QString PingModel::getSelectedIp()
{
    return m_selectedIp;
}

void PingModel::setSelectedIp(QString ip)
{
    m_selectedIp=ip;
    emit selectedIpChanged(ip);
}
