#include "minutekeyboardstate.h"

MinuteKeyboardState::MinuteKeyboardState()
{

}

bool MinuteKeyboardState::validate(QString nstring)
{
    bool isNum;
    int a = nstring.toInt(&isNum);
    if(isNum){
        return 0<=a && a<60;
    }
    return false;
}
