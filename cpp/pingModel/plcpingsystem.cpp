#include "plcpingsystem.h"

plcPingSystem::plcPingSystem()
{

}

QString plcPingSystem::getPingResult(QString ip)
{
    const QString ping = "ping %1 -c 3";
    QString out;
    MyLogger::log("pingSystem", "command: "+ping.arg(ip));
    os::System(ping.arg(ip), false, &out);
    return out;
}


