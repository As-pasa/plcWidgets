#ifndef COMMANDCONTROLLER_H
#define COMMANDCONTROLLER_H

#include <QObject>
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/fileModel/filemodel.h"
#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/commander/commands/importcommand.h"
#include "cpp/utilities/keyboard/password/passwordstate.h"
#include "cpp/passwordModel/passwordmodel.h"
class CommandController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int import_role READ import_role NOTIFY import_roleChanged)
private:
    ScreenController* m_controller;
    FileModel* m_fileModel;
    KeyboardBinder* m_binder;
    PasswordModel* m_password;
    int binder_import_role=-1;
public:
    explicit CommandController(ScreenController* controller,
                               FileModel* fileModel,
                               KeyboardBinder* binder,
                               PasswordModel* password,
                               QObject *parent = nullptr);
public slots:
    void import(QString filePath);
    int import_role();
signals:
    void import_roleChanged(int);

};

#endif // COMMANDCONTROLLER_H
