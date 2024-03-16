#ifndef MINUTEKEYBOARDSTATE_H
#define MINUTEKEYBOARDSTATE_H
#include <QDebug>
#include "../ikeyboardstate.h"
class MinuteKeyboardState:public IKeyboardState
{
public:
    MinuteKeyboardState();

    // IKeyboardState interface
private:
    bool validate(QString nstring);
};

#endif // MINUTEKEYBOARDSTATE_H
