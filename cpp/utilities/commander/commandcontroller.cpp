#include "commandcontroller.h"

CommandController::CommandController(ScreenController *controller, FileModel *fileModel,KeyboardBinder* binder,PasswordModel* password, QObject *parent)
{
    m_controller=controller;
    m_fileModel=fileModel;
    m_binder=binder;
    m_password=password;
    m_binder->addState(binder_import_role,new PasswordState(m_password));
    m_binder->addState(binder_export_role,new PasswordState(m_password));
    //m_binder->addState(binder_password_role,new PasswordState(m_password));
    m_binder->addState(binder_password_input_listener,new NoValidationState());
    m_binder->addConsumer(binder_password_input_listener,new PasswordChangeCommand(m_controller,m_password));
    m_binder->addState(binder_login_listener,new PasswordState(m_password));
    m_binder->addConsumer(binder_login_listener,new LogInCommand(m_controller));

}

void CommandController::import(QString filePath)
{
    m_controller->goToScreen(ScreenView::Screens::ImportConfirm);
    m_controller->showInfoWithText("close this window and \n input device password to proceed \n after that all local data will be erased\n and imported from: "+filePath);
    m_binder->removeListeners(binder_import_role);
    ImportCommand * command = new ImportCommand(binder_import_role, m_binder,m_controller,m_fileModel,filePath);
    m_binder->addConsumer(binder_import_role,command);
}

int CommandController::import_role()
{
    return binder_import_role;
}

int CommandController::export_role()
{
    return binder_export_role;
}

int CommandController::password_role()
{
    return binder_password_role;
}

int CommandController::password_input_listener()
{
    return binder_password_input_listener;
}

int CommandController::loginListener()
{
    return binder_login_listener;
}


void CommandController::exprt()
{
    QString stamp=m_stamer.getStamp();
    //m_controller->goToScreen(ScreenView::Screens::ExportConfirm);
    //m_controller->showInfoWithText("close this window and \n input device password to proceed \n after that all local data will be copied to: "+stamp);
    //m_binder->removeListeners(binder_export_role);
    //ExportCommand* command = new ExportCommand(binder_export_role,m_binder,m_controller,m_fileModel,stamp);
    //m_binder->addConsumer(binder_export_role,command);
    m_fileModel->copyTo(m_fileModel->selectedDevice(), stamp);
    m_controller->prevScreen();
    m_controller->showInfoWithText("successfully exporting to: \n"+stamp);

}

void CommandController::changePassword()
{
    m_controller->goToScreen(ScreenView::Screens::PasswordInstallConfirm);
    m_controller->showInfoWithText("close this window and \n input device password to proceed");
    m_binder->removeListeners(binder_export_role);
    PasswordInputInitCommand* command=new PasswordInputInitCommand(binder_password_role,m_binder,m_controller);
    m_binder->addConsumer(binder_password_role,command);
}

void CommandController::login()
{
    m_controller->goToScreen(ScreenView::Screens::LogInConfirm);

}


