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




bool KeyboardBinder::validate(int role, QString input)
{
    if(m_states.contains(role)){
        return m_states[role]->validate(input);
    }
    return false;
}

void KeyboardBinder::apply(int role, QString input)
{
    if(m_states.contains(role)){
        if(m_states[role]->validate(input)){
            if(m_consumers.contains(role)){
                foreach(auto a , m_consumers[role]){
                    a->consume(input);
                }
            }
        }
    }
}
