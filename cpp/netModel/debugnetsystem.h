#ifndef DEBUGNETSYSTEM_H
#define DEBUGNETSYSTEM_H
#include "interfacecredential.h"
#include "inetsystem.h"
#include <QObject>
#include <QDebug>
class DebugNetSystem:public INetSystem
{
private:
    QList<InterfaceCredential> m_innerCons;
public:
    DebugNetSystem();
    QList<InterfaceCredential> getConnections();
    void setupInterface(InterfaceCredential);
};

#endif // DEBUGNETSYSTEM_H
