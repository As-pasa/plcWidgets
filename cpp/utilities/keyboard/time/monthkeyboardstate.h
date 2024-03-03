#ifndef MONTHKEYBOARDSTATE_H
#define MONTHKEYBOARDSTATE_H

#include "../ikeyboardstate.h"
#include "../../../timeModel/timemodel.h"
class MonthKeyboardState:public IKeyboardState
{
public:
    MonthKeyboardState(TimeModel* timeModel);

    // IKeyboardState interface
private:
    TimeModel* m_model;
    bool validate(QString nstring);
};

#endif // MONTHKEYBOARDSTATE_H
