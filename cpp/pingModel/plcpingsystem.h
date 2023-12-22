#ifndef PLCPINGSYSTEM_H
#define PLCPINGSYSTEM_H
#include "../utilities/os.h"
#include "ipingsystem.h"
#include "../utilities/mylogger.h"
class plcPingSystem:public IPingSystem
{
public:
    plcPingSystem();

    // ipingsystem interface
public:
    QString getPingResult(QString ip);

};

#endif // PLCPINGSYSTEM_H
