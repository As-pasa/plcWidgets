#ifndef PLCWIFISYSTEM_H
#define PLCWIFISYSTEM_H

#include "iwifisystem.h"
#include <QFile>
#include <QProcess>
class PLCWifiSystem:public IWifiSystem
{
public:
    PLCWifiSystem();
    QList<WifiConnection> innerCache;

    // IWifiSystem interface
public:
    void setWifiConnection(QString wifiName, QString wifiPassword,bool isPasswordRequired=false);
    QList<WifiConnection> getWifiConnectionList();
    int getWifiConnectionLength();
    void refreshConnectionList();
    WifiConnection getWifiConnectionFromId(int);
};

#endif // PLCWIFISYSTEM_H
