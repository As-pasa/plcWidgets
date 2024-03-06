#include "commandcontroller.h"

CommandController::CommandController(ScreenController *controller, FileModel *fileModel,KeyboardBinder* binder,PasswordModel* password, QObject *parent)
{
    m_controller=controller;
    m_fileModel=fileModel;
    m_binder=binder;
    m_password=password;
    m_binder->addState(binder_import_role,new PasswordState(m_password));
}

void CommandController::import(QString filePath)
{
    m_controller->goToScreen(ScreenView::Screens::ImportConfirm);
    m_binder->removeListeners(binder_import_role);
    ImportCommand * command = new ImportCommand(binder_import_role, m_binder,m_controller,m_fileModel,filePath);
    m_binder->addConsumer(binder_import_role,command);
}

int CommandController::import_role()
{
    return binder_import_role;
}


