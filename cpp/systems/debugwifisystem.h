#ifndef DEBUGWIFISYSTEM_H
#define DEBUGWIFISYSTEM_H

#include "iwifisystem.h"
#include <QDebug>
class DebugWifiSystem:public IWifiSystem
{
public:
    DebugWifiSystem();
    QList<WifiConnection> cons;

    // IWifiSystem interface
public:
    void setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt=false);
    QList<WifiConnection> getWifiConnections();
};

#endif // DEBUGWIFISYSTEM_H
