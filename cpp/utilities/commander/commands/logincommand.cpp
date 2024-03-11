#include "logincommand.h"

LogInCommand::LogInCommand(ScreenController *controller)
{
    m_controller=controller;
}

void LogInCommand::consume(IKeyboardState *st)
{
    if(!st->validate(st->getState())){
        m_controller->showInfoWithText("Wrong password");

    }
    else{
        m_controller->goToScreen(ScreenView::Screens::TopMenu);
    }
}
