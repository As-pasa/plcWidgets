#include "wificonnection.h"





WifiConnection WifiConnection::from(QString name, QString frequency, QString bssid, QString security, QString signal1)
{
    WifiConnection con;
    con.name=name;
    con.frequency=frequency;
    con.bssid=bssid;
    con.security=security;
    con.signal1=signal1;
    return con;
}
