#include "ipconsumers.h"

IpConsumer::IpConsumer(ScreenController* controller,NetInterfaceInputState *output)
{
    m_output=output;
    m_controller=controller;
}

void IpConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }

    m_output->setIp(st->getState());
    st->clearState();
}

MaskConsumer::MaskConsumer(ScreenController* controller,NetInterfaceInputState *output)
{


    m_output=output;
    m_controller=controller;
}

void MaskConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }
    m_output->setMask(st->getState());
    st->clearState();
}

GateConsumer::GateConsumer(ScreenController* controller,NetInterfaceInputState *output)
{
    m_output=output;
    m_controller=controller;
}

void GateConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }
    m_output->setGate(st->getState());
    st->clearState();
}
