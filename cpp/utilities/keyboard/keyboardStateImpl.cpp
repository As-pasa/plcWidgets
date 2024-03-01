#include "keyboardStateImpl.h"

NoValidationKeyboardState::NoValidationKeyboardState()
{

}

bool NoValidationKeyboardState::validate(QString nstring)
{
    return true;
}
