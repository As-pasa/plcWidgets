#ifndef NOVALIDATIONKEYBOARDSTATE_H
#define NOVALIDATIONKEYBOARDSTATE_H

#include "ikeyboardstate.h"
class NoValidationKeyboardState : public IKeyboardState
{
public:
    NoValidationKeyboardState();

    // IKeyboardState interface
private:
    bool validate(QString nstring);
};

#endif // NOVALIDATIONKEYBOARDSTATE_H
