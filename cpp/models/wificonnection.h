#ifndef WIFICONNECTION_H
#define WIFICONNECTION_H

#include <QString>
class WifiConnection
{
public:
    WifiConnection(QString name,
        QString frequency,
        QString bssid,
        QString security,
        QString signal1);


    QString name;
    QString frequency;
    QString bssid;
    QString security;
    QString signal1;
    bool operator==(WifiConnection& other);

};

#endif // WIFICONNECTION_H
