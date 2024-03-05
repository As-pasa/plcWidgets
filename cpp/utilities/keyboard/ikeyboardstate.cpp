#include "ikeyboardstate.h"

QString IKeyboardState::processSpecial(QString old, QString addition)
{
    if(addition=="back" && old.length()>=1){
        return old.chopped(1);
    }

    return old;
}

QString IKeyboardState::getState()
{
    return m_state;
}

void IKeyboardState::clearState()
{
    m_state="";
}

bool IKeyboardState::add(QString ch)
{
    if(specialSymbols.contains(ch)){
        m_state=processSpecial(m_state,ch);
        return true;
    }
    else{


            m_state+=ch;
            return true;
    }
    return false;

}

IKeyboardState::IKeyboardState()
{
    m_state="";
}

IKeyboardState::~IKeyboardState()
{

}
