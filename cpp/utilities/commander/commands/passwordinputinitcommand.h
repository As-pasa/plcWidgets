#ifndef PASSWORDINPUTINITCOMMAND_H
#define PASSWORDINPUTINITCOMMAND_H


#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/commander/commands/passwordchangecommand.h"
class PasswordInputInitCommand:public KeyboardConsumer
{
private:
    KeyboardBinder* m_binder;
    ScreenController* m_controller;
    FileModel* m_model;
    int m_role;
public:
    PasswordInputInitCommand(int s_role,KeyboardBinder* binder,
                             ScreenController* controller);

    // KeyboardConsumer interface
public:
    void consume(IKeyboardState *st);
};

#endif // PASSWORDINPUTINITCOMMAND_H
