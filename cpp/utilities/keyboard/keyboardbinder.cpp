#include "keyboardbinder.h"



KeyboardBinder::KeyboardBinder(ScreenController* controller, QObject *parent)
{
    m_controller=controller;
    defaultCancelConsumer=new BackConsumer(controller);
}

void KeyboardBinder::addConsumer(int role, KeyboardConsumer *consumer)
{
    if(m_acceptConsumers.contains(role)){
        m_acceptConsumers[role].append(consumer);
    }
    else{
        m_acceptConsumers[role]=QList<KeyboardConsumer*>{consumer};
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
            if(m_cancelConsumers.contains(role)){
                foreach(auto a, m_cancelConsumers[role]){
                    a->consume(m_states[role]);
                }
            }
            else{
                defaultCancelConsumer->consume(m_states[role]);
            }
        }
        else if(ch=="acc"){
            apply(role);
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
    if(m_acceptConsumers.contains(role) && m_states.contains(role)){

            foreach(KeyboardConsumer* cons,m_acceptConsumers[role]){
                cons->consume(m_states[role]);
            }
        }
    return true;
}
