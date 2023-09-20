#include "debugnetsystem.h"

DebugNetSystem::DebugNetSystem()
{

}

void DebugNetSystem::setNetInterfaceCredentials(InterfaceCredentials &credentials)
{
    qDebug()<<"netCredentials set for interface"<< credentials.name;
}

QMap<QString, InterfaceCredentials> DebugNetSystem::getNetInterfaces()
{
    qDebug()<<"interface list requested";
    return QMap<QString,InterfaceCredentials>();
}
