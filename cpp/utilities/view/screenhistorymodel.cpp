#include "screenhistorymodel.h"

screenHistoryModel::screenHistoryModel(int current)
{
    m_current=current;
}

void screenHistoryModel::add(int el)
{
    m_stack.push(m_current);
    m_current=el;
}

int screenHistoryModel::current()
{
    return m_current;
}

void screenHistoryModel::back()
{
    if(!m_stack.empty()){
        m_current=m_stack.pop();
    }
}

int screenHistoryModel::top()
{
    if(!m_stack.empty()){
        return m_stack.top();
    }
    return m_current;
}


