#ifndef WIFISYSTEM_H
#define WIFISYSTEM_H

#include <QString>
#include <QDebug>
#include <QList>
#include "wificonnection.h"
class IWifiSystem
{
public:
    IWifiSystem();
    virtual void setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt=false)=0;
    virtual int getWifiConnectionLength()=0;
    virtual QList<WifiConnection> getWifiConnectionList()=0;
    virtual void refreshConnectionList()=0;
    virtual WifiConnection getWifiConnectionFromId(int)=0;
};

#endif // WIFISYSTEM_H
