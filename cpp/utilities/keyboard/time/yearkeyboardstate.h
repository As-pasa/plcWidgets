#ifndef YEARKEYBOARDSTATE_H
#define YEARKEYBOARDSTATE_H

#include "../ikeyboardstate.h"
#include "../../../timeModel/timemodel.h"
class YearKeyboardState:public IKeyboardState
{
public:
    YearKeyboardState(TimeModel* timeModel);

    // IKeyboardState interface
private:
        TimeModel* m_model;
    bool validate(QString nstring);
};

#endif // YEARKEYBOARDSTATE_H
