#include "wificonnection.h"

WifiConnection::WifiConnection(QString cname, QString cfrequency, QString cbssid, QString csecurity, QString csignal1):name(cname),frequency(cfrequency),bssid(cbssid),security(csecurity),signal1(csignal1)
{

}

bool WifiConnection::operator==(WifiConnection &other)
{
    return name==other.name&bssid==other.bssid;
}

