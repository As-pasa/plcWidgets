#include "commandcontroller.h"

CommandController::CommandController(ScreenController *controller, FileModel *fileModel, KeyboardBinder* binder, PasswordModel* password, PingModel *pinger,WifiModel* wifi, QObject *parent)
{
    m_controller=controller;
    m_fileModel=fileModel;
    m_binder=binder;
    m_ping=pinger;
    m_password=password;
    m_wifi=wifi;
    m_binder->addState(binder_import_role,new PasswordState(m_password));
    m_binder->addState(binder_export_role,new PasswordState(m_password));
    m_binder->addState(binder_password_role,new PasswordState(m_password));
    m_binder->addState(binder_password_input_listener,new NoValidationState());
    m_binder->addConsumer(binder_password_input_listener,new PasswordChangeCommand(m_controller,m_password));
    m_binder->addState(binder_login_listener,new PasswordState(m_password));
    m_binder->addConsumer(binder_login_listener,new LogInCommand(m_controller));

    m_binder->addState(KeyBinderRoles::PingIp,new IpKeyboardState());
    m_binder->addConsumer(KeyBinderRoles::PingIp,new PingIpConsumer(m_controller,m_ping));
    m_binder->addState(KeyBinderRoles::WifiPassword,new NoValidationState());
    m_binder->addConsumer(KeyBinderRoles::WifiPassword, new WifiPasswordConsumer(m_controller,m_wifi));
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

void CommandController::ping()
{
    m_controller->showInfoWithText("pinging... please wait\n ip:"+m_ping->getSelectedIp());

    PingProcessWrapper* wrapper=new PingProcessWrapper(m_ping->getSelectedIp());
    QThread* thread=new QThread;
    wrapper->moveToThread(thread);
    connect(wrapper, SIGNAL(finished()),thread, SLOT(quit()));
    connect(thread, SIGNAL(started()),wrapper, SLOT(process()));
    connect(wrapper,SIGNAL(finished()),wrapper, SLOT(deleteLater()));
    connect(thread, SIGNAL(finished()),thread, SLOT(deleteLater()));
    connect(wrapper,&PingProcessWrapper::gotAnswer, this, &CommandController::showResult);
    thread->start();
}

void CommandController::showResult(QString data)
{
    m_controller->showInfoWithText(data);
}



