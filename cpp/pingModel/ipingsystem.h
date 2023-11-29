#ifndef IPINGSYSTEM_H
#define IPINGSYSTEM_H

#include <QObject>
class IPingSystem
{
public:
    IPingSystem();
    virtual QString getPingResult(QString ip)=0;

};

#endif // IPINGSYSTEM_H
