#include "gatewaypasswordconsumer.h"


GatewayPasswordConsumer::GatewayPasswordConsumer(ScreenController *controller)
{
    m_controller=controller;
}

void GatewayPasswordConsumer::consume(IKeyboardState* st)
{
   if(st->validate(st->getState())){
       m_controller->openTheGate();
   }
   else{
       qDebug()<<"err";
       m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
   }
}
