#ifndef KEYBOARDCONSUMER_H
#define KEYBOARDCONSUMER_H

#include <QString>
class KeyboardConsumer
{
public:
    virtual void consume(QString st)=0;
    KeyboardConsumer();
};

#endif // KEYBOARDCONSUMER_H
