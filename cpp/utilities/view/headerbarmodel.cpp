#include "headerbarmodel.h"

HeaderBarModel::HeaderBarModel(QObject *parent) : QObject(parent)
{
    m_currentState=HeaderBarModel::Opened;
}

void HeaderBarModel::setState(HeaderBarModel::BarStates state)
{
       m_currentState=state;
       emit BarStateChanged(getCurrentState());
}

QString HeaderBarModel::getCurrentState()
{
    return StateToName[m_currentState];
}

const QMap<HeaderBarModel::BarStates,QString> HeaderBarModel::StateToName={
    {HeaderBarModel::Opened,"opened"},
    {HeaderBarModel::Closed,"closed"}
};
