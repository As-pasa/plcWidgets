#include "netmodel.h"

NetModel::NetModel(INetSystem *system)
{
    m_system=system;
}

void NetModel::setInterfaceCredential(InterfaceCredentials &credentials)
{
    m_system->setNetInterfaceCredentials(credentials);
    emit credentialStatusChanged(credentials);
}

QMap<QString, InterfaceCredentials> NetModel::getInterfaces()
{
    return m_system->getNetInterfaces();
}
