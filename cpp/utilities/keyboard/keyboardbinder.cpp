#include "keyboardbinder.h"

KeyboardBinder::KeyboardBinder(QObject *parent) : QObject(parent)
{

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
        if(m_states[role]->add(ch)){
          emit stateChanged();
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

void KeyboardBinder::apply(int role)
{
    if(m_consumers.contains(role) && m_states.contains(role)){
        foreach(KeyboardConsumer* cons,m_consumers[role]){
            cons->consume(m_states[role]->getState());
        }
    }
}
