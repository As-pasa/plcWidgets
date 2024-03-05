#ifndef IPCONSUMERS_H
#define IPCONSUMERS_H

#include "../keyboardconsumer.h"
#include "netinterfaceinputstate.h"
class IpConsumer:public KeyboardConsumer
{
private:
    NetInterfaceInputState* m_output;
public:
    IpConsumer(NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(QString st);
};
class MaskConsumer:public KeyboardConsumer
{
private:
    NetInterfaceInputState* m_output;
public:
    MaskConsumer(NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(QString st);
};
class GateConsumer:public KeyboardConsumer
{
private:
    NetInterfaceInputState* m_output;
public:
    GateConsumer(NetInterfaceInputState* output);

    // KeyboardConsumer interface
public:
    void consume(QString st);
};


#endif // IPCONSUMERS_H
