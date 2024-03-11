#ifndef IPCONSUMERS_H
#define IPCONSUMERS_H

#include "../keyboardconsumer.h"
#include "netinterfaceinputstate.h"
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/pingModel/pingmodel.h"
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
class PingIpConsumer:public KeyboardConsumer{
private:
    PingModel* m_model;
    ScreenController* m_controller;
public:
    PingIpConsumer(ScreenController* controller, PingModel* model);



    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // IPCONSUMERS_H
