#include "pingprocesswrapper.h"


PingProcessWrapper::PingProcessWrapper(QString ip, QObject *parent)
{
    m_ip=ip;
}

PingProcessWrapper::~PingProcessWrapper()
{

}

void PingProcessWrapper::process()
{
    QProcess proc;
    proc.setProcessChannelMode(QProcess::MergedChannels);
    proc.start(m_ip);
    proc.waitForFinished(6000);
    output= proc.readAll();
    emit finished();
    emit gotAnswer(output);
}
