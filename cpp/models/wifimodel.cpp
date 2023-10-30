#include "wifimodel.h"

WifiModel::WifiModel(IWifiSystem *wifiSystem)
{
    m_system=wifiSystem;
    connections=m_system->getWifiConnections();
}

int WifiModel::declaredLength()
{
    return connections.length();
}

void WifiModel::refresh()
{
    connections=m_system->getWifiConnections();
    emit declaredLengthChanged(connections.length());
}

QVariant WifiModel::fromId(int id)
{
    return QVariant::fromValue(connections[id]);
}

