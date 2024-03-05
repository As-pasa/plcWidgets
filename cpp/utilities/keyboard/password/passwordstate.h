#ifndef PASSWORDSTATE_H
#define PASSWORDSTATE_H

#include "../../../passwordModel/passwordmodel.h"
#include "../ikeyboardstate.h"
class PasswordState:public IKeyboardState{
    PasswordModel* m_model;
public:
    PasswordState(PasswordModel* model);


    // IKeyboardState interface
public:
    bool validate(QString nstring);
};

#endif // PASSWORDSTATE_H
