#ifndef BINDERDEFAULTCONSUMERS_H
#define BINDERDEFAULTCONSUMERS_H
#include "keyboardconsumer.h"
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/utilities/keyboard/ikeyboardstate.h"
class BackConsumer:public KeyboardConsumer{

    // KeyboardConsumer interface
private:
    ScreenController* m_controller;

public:
    BackConsumer(ScreenController * controller);
    void consume(IKeyboardState* state);
};

#endif // BINDERDEFAULTCONSUMERS_H
