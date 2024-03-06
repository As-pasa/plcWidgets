#ifndef KEYBOARDCONSUMER_H
#define KEYBOARDCONSUMER_H

#include "ikeyboardstate.h"
class KeyboardConsumer
{
public:
    virtual void consume(IKeyboardState* st)=0;
    KeyboardConsumer();
    virtual ~KeyboardConsumer();
};

#endif // KEYBOARDCONSUMER_H
