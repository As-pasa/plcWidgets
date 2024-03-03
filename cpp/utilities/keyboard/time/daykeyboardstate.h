#ifndef DAYVALIDATOR_H
#define DAYVALIDATOR_H

#include "../ikeyboardstate.h"
#include "../../../timeModel/timemodel.h"
class DayKeyboardState:public IKeyboardState
{
public:
    DayKeyboardState(TimeModel* timeModel);
private:
    TimeModel* m_model;
    // IKeyboardState interface
private:
    bool validate(QString nstring);
};

#endif // DAYVALIDATOR_H
