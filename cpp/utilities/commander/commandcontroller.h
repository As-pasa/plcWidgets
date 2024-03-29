#ifndef COMMANDCONTROLLER_H
#define COMMANDCONTROLLER_H

#include <QObject>
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/fileModel/filemodel.h"
#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/commander/commands/importcommand.h"
#include "cpp/utilities/commander/commands/exportcommand.h"
#include "cpp/utilities/commander/commands/passwordinputinitcommand.h"
#include "cpp/utilities/commander/commands/passwordchangecommand.h"
#include "cpp/utilities/commander/commands/logincommand.h"
#include "cpp/pingModel/pingmodel.h"
#include "cpp/utilities/keyboard/password/passwordstate.h"
#include "cpp/passwordModel/passwordmodel.h"
#include "cpp/fileModel/filesystemtimestamper.h"
#include "cpp/utilities/keyboard/novalidationstate.h"
#include "cpp/utilities/os.h"
#include "cpp/pingModel/pingprocesswrapper.h"
#include "cpp/utilities/commander/commands/wifipasswordconsumer.h"
#include "cpp/utilities/keyboard/time/keybinderroles.h"
#include "cpp/utilities/keyboard/network/ipkeyboardstate.h"
#include "cpp/utilities/keyboard/network/ipconsumers.h"
#include <QThread>
class CommandController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int import_role READ import_role NOTIFY import_roleChanged)
    Q_PROPERTY(int export_role READ export_role NOTIFY export_roleChanged)
    Q_PROPERTY(int password_role READ password_role NOTIFY password_roleChanged)
    Q_PROPERTY(int  password_input_listener READ password_input_listener NOTIFY password_input_listenerChanged)
    Q_PROPERTY(int login_listener READ loginListener NOTIFY loginListenerChanged)
private:
    ScreenController* m_controller;
    FileModel* m_fileModel;
    KeyboardBinder* m_binder;
    PasswordModel* m_password;
    FileSystemTimeStamper m_stamer;
    PingModel* m_ping;
    WifiModel* m_wifi;

    int binder_import_role=-1;
    int binder_export_role=-2;
    int binder_password_role=-3;
    int binder_password_input_listener=-4;
    int binder_login_listener=-5;
public:
    explicit CommandController(ScreenController* controller,
                               FileModel* fileModel,
                               KeyboardBinder* binder,
                               PasswordModel* password,
                               PingModel* pinger,
                               WifiModel* wifi,
                               QObject *parent = nullptr);
public slots:
    void import(QString filePath);
    int import_role();
    int export_role();
    int password_role();
    int password_input_listener();
    int loginListener();
    void exprt();
    void changePassword();
    void login();
    void ping();
    void showResult(QString data);
signals:
    void password_roleChanged(int);
    void import_roleChanged(int);
    void export_roleChanged(int);
    void password_input_listenerChanged(int);
    void loginListenerChanged(int);



};

#endif // COMMANDCONTROLLER_H
