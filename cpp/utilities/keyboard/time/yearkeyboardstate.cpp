#include "yearkeyboardstate.h"



YearKeyboardState::YearKeyboardState(TimeModel* timeModel)
{
    m_model=timeModel;
}


bool YearKeyboardState::validate(QString nstring)
{
    bool isNum;
    int a = nstring.toInt(&isNum);
    if(isNum){
        int month = m_model->currentTime().date().month();
        int day = m_model->currentTime().date().day();
        return QDate::isValid(a,month,day);
    }
    return false;

}

