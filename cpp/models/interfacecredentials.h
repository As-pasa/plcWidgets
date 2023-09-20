#ifndef INTERFACECREDENTIALS_H
#define INTERFACECREDENTIALS_H

#include <QHostAddress>
class InterfaceCredentials
{
public:
    InterfaceCredentials(QString cname,
                         QHostAddress cip,
                         QHostAddress cmask,
                         QHostAddress cdefaultName,bool cDHCPstatus);
    InterfaceCredentials();
    QHostAddress ip;
    QHostAddress mask;
    QHostAddress defaultGate;
    QString name;
    bool DHCPStatus;
    bool operator==(InterfaceCredentials& other);


};

#endif // INTERFACECREDENTIALS_H
