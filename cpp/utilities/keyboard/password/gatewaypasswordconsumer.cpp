#include "gatewaypasswordconsumer.h"


GatewayPasswordConsumer::GatewayPasswordConsumer(ScreenController *controller)
{
    m_controller=controller;
}

void GatewayPasswordConsumer::consume(QString st)
{
   m_controller->openTheGate();
}
