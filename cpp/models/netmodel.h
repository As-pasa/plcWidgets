#ifndef NETMODEL_H
#define NETMODEL_H
#include <QMap>
#include "interfacecredentials.h"

#include "../systems/inetsystem.h"


class NetModel: public QObject
{
    Q_OBJECT
public:
    NetModel(INetSystem* system);
    void setInterfaceCredential(InterfaceCredentials& credentials);
    QMap<QString,InterfaceCredentials> getInterfaces();
private:
    INetSystem* m_system;
signals:
    void credentialStatusChanged(InterfaceCredentials);
};

#endif // NETMODEL_H
