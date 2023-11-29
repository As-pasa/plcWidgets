#include "pingmodel.h"

PingModel::PingModel(DebugPingSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
}


void PingModel::startPing(QString ip){

    lastPingResult= m_system->getPingResult(ip);
    emit pingExecutionEnded();
}




QString PingModel::getPingResult(){
    return lastPingResult;

}
