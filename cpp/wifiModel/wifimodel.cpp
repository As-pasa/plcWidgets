#include "wifimodel.h"

WifiModel::WifiModel(IWifiSystem *wifiSystem)
{
    m_system=wifiSystem;

}

int WifiModel::declaredLength()
{
    return m_system->getWifiConnectionLength();
}

void WifiModel::tryConnect(int id,  QString password)
{
    auto wificon=m_system->getWifiConnectionFromId(id);

    m_system->setWifiConnection(wificon.name,password,wificon.security=="NONE");
}

void WifiModel::refresh()
{
    m_system->refreshConnectionList();
    emit declaredLengthChanged(m_system->getWifiConnectionLength());
}

QVariant WifiModel::fromId(int id)
{
    return QVariant::fromValue(m_system->getWifiConnectionFromId(id));
}

