#ifndef DEBUGWIFISYSTEM_H
#define DEBUGWIFISYSTEM_H

#include "iwifisystem.h"
#include <QDebug>
class DebugWifiSystem:public IWifiSystem
{
public:
    DebugWifiSystem();
    QList<WifiConnection> cons;
    QList<WifiConnection> cons2;
    QList<WifiConnection> currentCons;
    bool usedCons2=false;



    // IWifiSystem interface
public:
    void setWifiConnection(QString wifiName, QString wifiPassword, bool null_mgmt);
    int getWifiConnectionLength();
    QList<WifiConnection> getWifiConnectionList();
    void refreshConnectionList();
    WifiConnection getWifiConnectionFromId(int);
};

#endif // DEBUGWIFISYSTEM_H
