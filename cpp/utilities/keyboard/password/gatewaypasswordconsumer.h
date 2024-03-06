#ifndef GATEWAYPASSWORDCONSUMER_H
#define GATEWAYPASSWORDCONSUMER_H

#include "cpp/utilities/view/screencontroller.h"
#include "../keyboardconsumer.h"
class GatewayPasswordConsumer:public KeyboardConsumer
{
public:

    GatewayPasswordConsumer(ScreenController* controller);
private:
    ScreenController* m_controller;
    // KeyboardConsumer interface
public:
    void consume(IKeyboardState* st);
};

#endif // GATEWAYPASSWORDCONSUMER_H
