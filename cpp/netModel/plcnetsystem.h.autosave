#ifndef PLCNETSYSTEM_H
#define PLCNETSYSTEM_H

#include <QObject>
#include "inetsystem.h"
#include <QNetworkInterface>
#include "../utilities/os.h"
#include <QFile>
#include "cpp/utilities/mylogger.h"
class PlcNetSystem:public INetSystem
{
public:
    PlcNetSystem();
private :
    QHostAddress getDefaultGateWay(QString dev, QString* pOutput);
    bool getDefdhcp(const QString dev, QString* pOutput);

    // INetSystem interface
public:
    QList<InterfaceCredential> getConnections();
    void setupInterface(InterfaceCredential);
};

#endif // PLCNETSYSTEM_H
