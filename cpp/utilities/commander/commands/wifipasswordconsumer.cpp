#include "wifipasswordconsumer.h"

WifiPasswordConsumer::WifiPasswordConsumer(ScreenController *controller, WifiModel *model)
{
    m_controller=controller;
    m_model=model;
}

void WifiPasswordConsumer::consume(IKeyboardState *st)
{
    m_controller->prevScreen();
    m_model->tryConnect(m_model->getSelectedNetworkName(),st->getState());
    m_controller->showInfoWithText("connection tried with proposed password");
}
