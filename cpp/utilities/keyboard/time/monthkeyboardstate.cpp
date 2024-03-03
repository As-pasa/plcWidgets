#include "monthkeyboardstate.h"

MonthKeyboardState::MonthKeyboardState(TimeModel *timeModel)
{
        m_model=timeModel;
}

bool MonthKeyboardState::validate(QString nstring)
{
    bool isNum;
    int a = nstring.toInt(&isNum);
    if(isNum){
        int day = m_model->currentTime().date().day();
        int year = m_model->currentTime().date().year();
        return QDate::isValid(year,a,day);
    }
    return false;
}
