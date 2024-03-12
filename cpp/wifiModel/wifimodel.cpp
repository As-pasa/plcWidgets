#include "wifimodel.h"

WifiModel::WifiModel(IWifiSystem *wifiSystem)
{
    m_system=wifiSystem;

}

int WifiModel::declaredLength()
{
    return m_system->getWifiConnectionLength();
}

QString WifiModel::getSelectedNetworkName()
{
    return selectedNetworkName;
}

void WifiModel::setSelectedNetworkName(QString a)
{
    selectedNetworkName=a;
}

void WifiModel::tryConnect(int id,  QString password)
{
    auto wificon=m_system->getWifiConnectionFromId(id);
    if(wificon.name=="err" && wificon.bssid=="err"){
        MyLogger::err("wifiModel","attempt to connect to errror wifi");
    }
    m_system->setWifiConnection(wificon.name,password,wificon.security=="NONE");
}

void WifiModel::tryConnect(QString name, QString password)
{
    m_system->setWifiConnection(name,password,"NONE");
}

void WifiModel::refresh()
{
    m_system->refreshConnectionList();
    emit declaredLengthChanged(m_system->getWifiConnectionLength());
}

QVariant WifiModel::fromId(int id)
{
    if(id>=declaredLength()){
        MyLogger::err("wifiModel","ui requested index out of range");
        return QVariant::fromValue(WifiConnection::from("err","err","err","err","err"));
    }
    return QVariant::fromValue(m_system->getWifiConnectionFromId(id));
}

QStringList WifiModel::getDeclaredNetworks()
{
    QStringList ans;
    foreach(auto a , m_system->getWifiConnectionList()){
        ans.append(a.name);
    }
    return ans;
}

