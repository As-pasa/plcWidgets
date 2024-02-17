#include "headerbarmodel.h"

HeaderBarModel::HeaderBarModel(QObject *parent) : QObject(parent)
{
    m_currentState=HeaderBarModel::Opened;
}

void HeaderBarModel::setState(int state)
{
       m_currentState=state;
       emit BarStateChanged(getCurrentState());
}

QString HeaderBarModel::getStateName(int state)
{
    return StateToName[state];
}

QString HeaderBarModel::getCurrentState()
{
    return getStateName(m_currentState);
}


const QMap<int,QString> HeaderBarModel::StateToName={
    {HeaderBarModel::Opened,"opened"},
    {HeaderBarModel::Closed,"closed"},
    {HeaderBarModel::Password,"password"}
};
