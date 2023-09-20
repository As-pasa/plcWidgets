#ifndef PLCWIFISYSTEM_H
#define PLCWIFISYSTEM_H

#include "iwifisystem.h"
#include <QFile>
#include <QProcess>
class PLCWifiSystem:public IWifiSystem
{
public:
    PLCWifiSystem();

    // IWifiSystem interface
public:
    void setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt=false);
    QList<WifiConnection> getWifiConnections();
};

#endif // PLCWIFISYSTEM_H
