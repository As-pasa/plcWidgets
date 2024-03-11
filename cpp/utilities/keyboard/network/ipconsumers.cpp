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
    m_controller->prevScreen();
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
    m_controller->prevScreen();
}

GateConsumer::GateConsumer(ScreenController* controller,NetInterfaceInputState *output)
{
    m_output=output;
    m_controller=controller;
    m_controller->prevScreen();
}

void GateConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }
    m_output->setGate(st->getState());
    st->clearState();
    m_controller->prevScreen();
}

PingIpConsumer::PingIpConsumer(ScreenController *controller, PingModel *model)
{
    m_model=model;
    m_controller=controller;
    m_controller->prevScreen();
}

void PingIpConsumer::consume(IKeyboardState *st)
{
    if(!st->validate(st->getState())){
        m_controller->showInfoWithText("Wrong input value:\n"+st->getState());
        return;
    }
    m_model->setSelectedIp(st->getState());
    m_controller->prevScreen();
    st->clearState();
}
