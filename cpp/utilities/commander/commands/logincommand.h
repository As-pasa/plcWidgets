#ifndef LOGINCOMMAND_H
#define LOGINCOMMAND_H

#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/keyboard/keyboardconsumer.h"

class LogInCommand:public KeyboardConsumer
{
private:
    ScreenController* m_controller;
public:
    LogInCommand(ScreenController* controller);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // LOGINCOMMAND_H
