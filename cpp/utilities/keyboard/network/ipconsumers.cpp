#include "ipconsumers.h"

IpConsumer::IpConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void IpConsumer::consume(IKeyboardState* st)
{
    m_output->setIp(st->getState());
    st->clearState();
}

MaskConsumer::MaskConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void MaskConsumer::consume(IKeyboardState* st)
{
    m_output->setMask(st->getState());
    st->clearState();
}

GateConsumer::GateConsumer(NetInterfaceInputState *output)
{
    m_output=output;
}

void GateConsumer::consume(IKeyboardState* st)
{
    m_output->setGate(st->getState());
    st->clearState();
}
