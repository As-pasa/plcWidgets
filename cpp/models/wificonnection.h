#ifndef WIFICONNECTION_H
#define WIFICONNECTION_H

#include <QString>
#include <QObject>
struct WifiConnection
{
private:
    Q_GADGET
    Q_PROPERTY(QString name MEMBER name)
    Q_PROPERTY(QString frequency MEMBER frequency)
    Q_PROPERTY(QString bssid MEMBER bssid)
    Q_PROPERTY(QString security MEMBER security)
    Q_PROPERTY(QString signal1 MEMBER signal1)



public:


    QString name;
    QString frequency;
    QString bssid;
    QString security;
    QString signal1;
static WifiConnection from(QString name, QString frequency, QString bssid, QString security, QString signal1);
};
Q_DECLARE_METATYPE(WifiConnection)
#endif // WIFICONNECTION_H
