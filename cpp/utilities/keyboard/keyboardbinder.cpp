#include "keyboardbinder.h"



KeyboardBinder::KeyboardBinder(ScreenController* controller, QObject *parent)
{
    m_controller=controller;
}

void KeyboardBinder::addConsumer(int role, KeyboardConsumer *consumer)
{
    if(m_consumers.contains(role)){
        m_consumers[role].append(consumer);
    }
    else{
        m_consumers[role]=QList<KeyboardConsumer*>{consumer};
    }
}

void KeyboardBinder::addState(int role, IKeyboardState *state)
{
    if(m_states.contains(role)){
        delete m_states[role];

    }
    m_states[role]=state;
}

void KeyboardBinder::process(int role,QString ch)
{


    if(m_states.contains(role)){
        if(ch=="close"){
            clear(role);
            m_controller->prevScreen();
        }
        else if(ch=="acc"){
           if(apply(role)){
               clear(role);
               if(role!=KeyBinderRoles::Password){
                    m_controller->prevScreen();
               }

           }
           else{
               m_controller->showInfoWithText("Wrong input value:\n"+ m_states[role]->getState());
           }

        }
        else{
            if(m_states[role]->add(ch)){
              emit stateChanged();
            }
        }


    }
}

void KeyboardBinder::clear(int role)
{
    if(m_states.contains(role)){
        m_states[role]->clearState();
        emit stateChanged();
    }
}

QString KeyboardBinder::getState(int role)
{
    if(m_states.contains(role)){
        return m_states[role]->getState();
    }
    return "ERROR";
}

bool KeyboardBinder::apply(int role)
{
    if(m_consumers.contains(role) && m_states.contains(role)){
        if(m_states[role]->validate(m_states[role]->getState())){
            foreach(KeyboardConsumer* cons,m_consumers[role]){
                cons->consume(m_states[role]->getState());
            }
        }
        else{
            return false;
        }
    }
    return true;
}
