#ifndef COMMANDCONTROLLER_H
#define COMMANDCONTROLLER_H

#include <QObject>
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/fileModel/filemodel.h"
#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/commander/commands/importcommand.h"
#include "cpp/utilities/commander/commands/exportcommand.h"
#include "cpp/utilities/commander/commands/passwordinputinitcommand.h"
#include "cpp/utilities/keyboard/password/passwordstate.h"
#include "cpp/passwordModel/passwordmodel.h"
#include "cpp/fileModel/filesystemtimestamper.h"
class CommandController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int import_role READ import_role NOTIFY import_roleChanged)
    Q_PROPERTY(int export_role READ export_role NOTIFY export_roleChanged)
    Q_PROPERTY(int password_role READ password_role_read NOTIFY password_roleChanged)
private:
    ScreenController* m_controller;
    FileModel* m_fileModel;
    KeyboardBinder* m_binder;
    PasswordModel* m_password;
    FileSystemTimeStamper m_stamer;
    int binder_import_role=-1;
    int binder_export_role=-2;
    int binder_password_role=-3;
    int binder_password_input_listener=-4;
public:
    explicit CommandController(ScreenController* controller,
                               FileModel* fileModel,
                               KeyboardBinder* binder,
                               PasswordModel* password,
                               QObject *parent = nullptr);
public slots:
    void import(QString filePath);
    int import_role();
    int export_role();
    int password_role();
    void exprt();
    void changePassword();
signals:
    void password_roleChanged(int);
    void import_roleChanged(int);
    void export_roleChanged(int);

};

#endif // COMMANDCONTROLLER_H
