#ifndef DEBUGNETSYSTEM_H
#define DEBUGNETSYSTEM_H

#include "inetsystem.h"
#include <QDebug>
class DebugNetSystem :public INetSystem
{
public:
    DebugNetSystem();

    // INetSystem interface
public:
    void setNetInterfaceCredentials(InterfaceCredentials &credentials);
    QMap<QString, InterfaceCredentials> getNetInterfaces();
};

#endif // DEBUGNETSYSTEM_H
