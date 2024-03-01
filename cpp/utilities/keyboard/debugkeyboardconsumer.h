#ifndef DEBUGKEYBOARDCONSUMER_H
#define DEBUGKEYBOARDCONSUMER_H

#include "keyboardconsumer.h"
#include "QDebug"
class DebugKeyboardConsumer:public KeyboardConsumer
{
public:
    DebugKeyboardConsumer();

    // KeyboardConsumer interface
public:
    void consume(QString st);
};

#endif // DEBUGKEYBOARDCONSUMER_H
