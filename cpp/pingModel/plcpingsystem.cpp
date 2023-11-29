#include "plcpingsystem.h"

plcPingSystem::plcPingSystem()
{

}

QString plcPingSystem::getPingResult(QString ip)
{
    const QString ping = "ping %1 -c 3";
    QString out;
    os::System(ping.arg(ip), false, &out);
    return out;
}


