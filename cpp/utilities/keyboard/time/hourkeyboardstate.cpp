#include "hourkeyboardstate.h"

HourKeyboardState::HourKeyboardState()
{

}

bool HourKeyboardState::validate(QString nstring)
{
    bool isNum;
    int a = nstring.toInt(&isNum);
    if(isNum){
        return 0<=a && a<24;
    }
    return false;
}
