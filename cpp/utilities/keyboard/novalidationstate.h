#ifndef NOVALIDATIONSTATE_H
#define NOVALIDATIONSTATE_H

#include "ikeyboardstate.h"
class NoValidationState:public IKeyboardState
{
public:
    NoValidationState();

    // IKeyboardState interface
public:
    bool validate(QString nstring);
};

#endif // NOVALIDATIONSTATE_H
