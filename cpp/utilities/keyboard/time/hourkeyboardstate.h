#ifndef HOURKEYBOARDSTATE_H
#define HOURKEYBOARDSTATE_H

#include "../ikeyboardstate.h"
class HourKeyboardState:public IKeyboardState
{
public:
    HourKeyboardState();

    // IKeyboardState interface
private:
    bool validate(QString nstring);
};

#endif // HOURKEYBOARDSTATE_H
