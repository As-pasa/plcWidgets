#ifndef WIFIMODEL_H
#define WIFIMODEL_H

#include <QObject>
#include "../systems/iwifisystem.h"
class WifiModel:public QObject
{
    Q_OBJECT

public:
    WifiModel(IWifiSystem* wifiSystem);
    void setWifiConnection(QString wifiName, QString wifiPassword);
    QList<WifiConnection> getWifiConnections();
private:
    IWifiSystem* m_system;
signals:
    void WifiConnectionAttempt(QString wifiName, QString wifiPassword);
};

#endif // WIFIMODEL_H
