#ifndef PASSWORDCHANGECOMMAND_H
#define PASSWORDCHANGECOMMAND_H

#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/passwordModel/passwordmodel.h"
class PasswordChangeCommand:public KeyboardConsumer
{
private:
    KeyboardBinder* m_binder;
    ScreenController* m_controller;
    PasswordModel* m_model;
public:
    PasswordChangeCommand(ScreenController* controller,int s_role,PasswordModel* model);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // PASSWORDCHANGECOMMAND_H
