#include "daykeyboardstate.h"



DayKeyboardState::DayKeyboardState(TimeModel *timeModel)
{
    m_model=timeModel;
}

bool DayKeyboardState::validate(QString nstring)
{
    bool isNum;
    int a = nstring.toInt(&isNum);
    if(isNum){
        int month = m_model->currentTime().date().month();
        int year = m_model->currentTime().date().year();
        return QDate::isValid(year,month,a);
    }
    return false;

}
