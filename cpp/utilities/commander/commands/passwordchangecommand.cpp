#include "passwordchangecommand.h"

PasswordChangeCommand::PasswordChangeCommand()
{

}

PasswordChangeCommand::PasswordChangeCommand(ScreenController *controller, int s_role, PasswordModel *model)
{

    m_controller=controller;
    m_model=model;
}

void PasswordChangeCommand::consume(IKeyboardState *st)
{
    m_model->setPassword(st->getState());
    m_controller->prevScreen();
    m_controller->prevScreen();
    m_controller->prevScreen();
    m_controller->showInfoWithText("close this screen and input new password");
}
