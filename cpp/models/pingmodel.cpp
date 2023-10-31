#include "pingmodel.h"

PingModel::PingModel(DebugPingSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
}


void PingModel::startLocalPing(QString ip){

    lastPingResult= m_system->getLocalPingResult(ip);
    emit pingExecutionEnded();
}


void PingModel::startWebPing(QString ip){

    lastPingResult= m_system->getWebPingResult(ip);
    emit pingExecutionEnded();
}

QString PingModel::getPingResult(){
    return lastPingResult;

}
