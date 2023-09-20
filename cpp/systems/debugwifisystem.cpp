#include "debugwifisystem.h"

DebugWifiSystem::DebugWifiSystem()
{

}

void DebugWifiSystem::setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt)
{
    qDebug()<<"wifi connection added with name "<< "wifiName "<<wifiName<<" password "<<   wifiPassword;
}

QList<WifiConnection> DebugWifiSystem::getWifiConnections()
{
    qDebug()<<"wifi connection list requested";
    return QList<WifiConnection>() << WifiConnection("noosphere","666","42.42.42.42","NONE","signal1");
}

