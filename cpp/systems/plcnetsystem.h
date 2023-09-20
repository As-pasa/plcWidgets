#ifndef PLCNETSYSTEM_H
#define PLCNETSYSTEM_H

#include "inetsystem.h"
#include <QFile>
#include <QNetworkInterface>
#include "../utilities/os.h"
class PLCNetSystem :public INetSystem
{
public:
    PLCNetSystem();

    // INetSystem interface
public:
    void setNetInterfaceCredentials(InterfaceCredentials &credentials);
    QMap<QString, InterfaceCredentials> getNetInterfaces();
private:
    QHostAddress getDefaultGateway(QString interfaceName);
    bool getDhcpStatus(QString interfaceName);
};

#endif // PLCNETSYSTEM_H
