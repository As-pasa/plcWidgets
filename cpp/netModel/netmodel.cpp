#include "netmodel.h"

NetModel::NetModel(INetSystem* sys,QObject *parent) : QObject(parent)
{

    m_system=sys;
    m_credentials=m_system->getConnections();
}

void NetModel::refresh()
{
    m_credentials=m_system->getConnections();
    emit declaredLengthChanged(m_credentials.length());
}

QVariant NetModel::fromId(int id)
{
    if(id>=m_credentials.length()){return QVariant::fromValue(InterfaceCredential::from("err","err","err","err",false));}
    return QVariant::fromValue(m_credentials[id]);

}

void NetModel::setInterface(QString name, QString ip, QString mask, QString gate, bool dhcpUsed)
{
    qDebug()<<dhcpUsed;
    m_system->setupInterface(InterfaceCredential::from(name,ip,mask,gate,dhcpUsed));
    refresh();
}

int NetModel::declaredLength()
{
    return m_credentials.length();
}
