#include "wifimodel.h"

WifiModel::WifiModel(IWifiSystem *wifiSystem)
{
    m_system=wifiSystem;
}

void WifiModel::setWifiConnection(QString wifiName, QString wifiPassword)
{
    m_system->setWifiConnection(wifiName,wifiPassword);
    emit WifiConnectionAttempt(wifiName,wifiPassword);
}

QList<WifiConnection> WifiModel::getWifiConnections()
{
    return m_system->getWifiConnections();
}
