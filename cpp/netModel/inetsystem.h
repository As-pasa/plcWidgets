#ifndef INETSYSTEM_H
#define INETSYSTEM_H

#include <QObject>
#include "interfacecredential.h"
#include <QList>
class INetSystem
{
public:
    virtual QList<InterfaceCredential> getConnections()=0;
    virtual void setupInterface(InterfaceCredential)=0;
};

#endif // INETSYSTEM_H
