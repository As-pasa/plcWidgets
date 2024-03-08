#include "passwordchangecommand.h"


PasswordChangeCommand::PasswordChangeCommand(ScreenController *controller,PasswordModel *model)
{

    m_controller=controller;
    m_model=model;
}

void PasswordChangeCommand::consume(IKeyboardState *st)
{
    m_model->setPassword(st->getState());
    m_controller->prevScreen();
    m_controller->showInfoWithText("password changed successfully to:\n" +st->getState());

}
