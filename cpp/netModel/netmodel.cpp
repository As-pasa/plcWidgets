#include "netmodel.h"

NetModel::NetModel(INetSystem* sys,QObject *parent) : QObject(parent)
{

    m_system=sys;
    m_credentials=m_system->getConnections();
}

void NetModel::refresh()
{
    m_credentials=m_system->getConnections();
    QString log;
    foreach (InterfaceCredential cr, m_credentials) {
        log+="\t"+cr.toString()+"\n";
    }
    MyLogger::log("netModel","model got net interfaces"+"length: "+m_credentials.length()+" :\n "+log);

    emit declaredLengthChanged(m_credentials.length());
}

QVariant NetModel::fromId(int id)
{
    if(id>=m_credentials.length()){
        MyLogger::err("netModel",QString("ui requested entry with out-of-bound index. declared Length: %1. Requested index: %2").arg(m_credentials.length(),id));
        return QVariant::fromValue(InterfaceCredential::from("err","err","err","err",false));}
    MyLogger::log("netmodel", "ui requested credential from model. Got: "+m_credentials[id]);
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
