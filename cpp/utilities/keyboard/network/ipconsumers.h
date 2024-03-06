#ifndef IPCONSUMERS_H
#define IPCONSUMERS_H

#include "../keyboardconsumer.h"
#include "netinterfaceinputstate.h"
#include "cpp/utilities/view/screencontroller.h"
class IpConsumer:public KeyboardConsumer
{
private:
    ScreenController* m_controller;
    NetInterfaceInputState* m_output;
public:
    IpConsumer(ScreenController* controller, NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState* st);
};
class MaskConsumer:public KeyboardConsumer
{
private:
    ScreenController* m_controller;
    NetInterfaceInputState* m_output;
public:
    MaskConsumer(ScreenController* controller,NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState* st);
};
class GateConsumer:public KeyboardConsumer
{
private:
    ScreenController* m_controller;
    NetInterfaceInputState* m_output;
public:
    GateConsumer(ScreenController* controller,NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState* st);
};


#endif // IPCONSUMERS_H
