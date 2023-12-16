#include "pingmodel.h"

PingModel::PingModel(IPingSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
}


void PingModel::startPing(QString ip){

    lastPingResult= m_system->getPingResult(ip);
    MyLogger::log("pingModel","ping execution ended. answer: "+lastPingResult);
    emit pingExecutionEnded();
    MyLogger::log("pingModel","ping execution ended signal emitted");
}




QString PingModel::getPingResult(){
    return lastPingResult;

}
