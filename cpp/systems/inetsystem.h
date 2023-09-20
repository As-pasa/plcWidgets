#ifndef INETSYSTEM_H
#define INETSYSTEM_H

#include "../models/interfacecredentials.h"
#include "QHostAddress"
class INetSystem
{
public:

    virtual void setNetInterfaceCredentials(InterfaceCredentials& credentials)=0;
    virtual QMap<QString, InterfaceCredentials> getNetInterfaces()=0;

};

#endif // INETSYSTEM_H
