#ifndef WIFISYSTEM_H
#define WIFISYSTEM_H

#include <QString>
#include <QDebug>
#include <QList>
#include "../models/wificonnection.h"
class IWifiSystem
{
public:
    IWifiSystem();
    virtual void setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt=false)=0;
    virtual QList<WifiConnection> getWifiConnections()=0;
};

#endif // WIFISYSTEM_H
