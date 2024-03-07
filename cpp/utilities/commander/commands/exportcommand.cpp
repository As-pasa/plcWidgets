#include "exportcommand.h"

ExportCommand::ExportCommand(int s_role,KeyboardBinder* binder, ScreenController *controller, FileModel *model,QString path)
{
    m_binder=binder;
    m_controller=controller;
    m_model=model;
    m_path=path;
    m_role=s_role;
}


void ExportCommand::consume(IKeyboardState *st)
{
    if(!st->validate(st->getState())){
        m_controller->showInfoWithText("Wrong password!");
    }
    else{
        m_model->copyTo(m_model->selectedDevice(),m_path);
        m_controller->prevScreen();
        m_controller->prevScreen();
        m_controller->showInfoWithText("successfully exporting to: \n"+m_path);
        m_binder->removeListeners(m_role);
        delete this;
    }
}
