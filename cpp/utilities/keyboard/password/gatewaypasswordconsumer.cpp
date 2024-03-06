#include "gatewaypasswordconsumer.h"


GatewayPasswordConsumer::GatewayPasswordConsumer(ScreenController *controller)
{
    m_controller=controller;
}

void GatewayPasswordConsumer::consume(IKeyboardState* st)
{
   m_controller->openTheGate();
}
