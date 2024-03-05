#include "netinterfaceinputstate.h"

void NetInterfaceInputState::setName(QString str)
{
    m_name=str;
}

void NetInterfaceInputState::setIp(QString str)
{
 m_ip=str;
 emit ipChanged(m_ip);
}

void NetInterfaceInputState::setMask(QString str)
{
    m_mask=str;
     emit maskChanged(m_mask);
}

void NetInterfaceInputState::setGate(QString str)
{
    m_gate=str;
     emit gateChanged(m_gate);
}

NetInterfaceInputState::NetInterfaceInputState(NetModel *model, QObject *parent)
{
    m_model=model;
}


void NetInterfaceInputState::accept()
{
    m_model->setInterface(m_name,m_ip,m_mask,m_gate,false);
}

QString NetInterfaceInputState::getIp()
{
    return m_ip;
}

QString NetInterfaceInputState::getMask()
{
    return m_mask;
}

QString NetInterfaceInputState::getGate()
{
    return m_gate;
}
