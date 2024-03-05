#include "ipconsumers.h"

IpConsumer::IpConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void IpConsumer::consume(QString st)
{
    m_output->setIp(st);
}

MaskConsumer::MaskConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void MaskConsumer::consume(QString st)
{
    m_output->setMask(st);
}

GateConsumer::GateConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void GateConsumer::consume(QString st)
{
    m_output->setGate(st);
}
