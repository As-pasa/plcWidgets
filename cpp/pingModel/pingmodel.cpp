#include "pingmodel.h"

PingModel::PingModel(MessageDisplayer* displayer,IPingSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
    m_displayer=displayer;
}


void PingModel::startPing(QString ip){

    lastPingResult= m_system->getPingResult(ip);
    MyLogger::log("pingModel","ping execution ended. answer: "+lastPingResult);
    //m_displayer->showMessage(lastPingResult);
    emit pingExecutionEnded();
    MyLogger::log("pingModel","ping execution ended signal emitted");

}




QString PingModel::getPingResult(){
    return lastPingResult;

}
