#include "binderdefaultconsumers.h"


BackConsumer::BackConsumer(ScreenController *controller)
{
    m_controller=controller;
}

void BackConsumer::consume(IKeyboardState *state)
{
    state->clearState();
    m_controller->prevScreen();
}
