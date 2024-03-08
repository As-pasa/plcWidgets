#include "passwordinputinitcommand.h"



PasswordInputInitCommand::PasswordInputInitCommand(int s_role, KeyboardBinder *binder, ScreenController *controller)
{
    m_role=s_role;
    m_binder=binder;
    m_controller=controller;
}

void PasswordInputInitCommand::consume(IKeyboardState *st)
{
    if(!st->validate(st->getState())){
        m_controller->showInfoWithText("Wrong password");
        return;
    }
    m_controller->prevScreen();
    m_controller->goToScreen(ScreenView::Screens::PasswordInstallScreen);
    m_controller->showInfoWithText("close this screen and input new password");
    m_binder->removeListeners(m_role);
    delete this;

}
