#include "importcommand.h"

ImportCommand::ImportCommand(int s_role,KeyboardBinder* binder, ScreenController *controller, FileModel *model,QString path)
{
    m_binder=binder;
    m_controller=controller;
    m_model=model;
    m_path=path;
    m_role=s_role;
}

void ImportCommand::consume(IKeyboardState *st)
{
    if(!st->validate(st->getState())){
        m_controller->showInfoWithText("Wrong password!");
    }
    else{
        m_model->copyFrom(m_model->selectedDevice(),m_path);
        m_controller->prevScreen();
        m_controller->showInfoWithText("successfully importing from: \n"+m_path);
        m_binder->removeListeners(m_role);
        delete this;
    }
}
