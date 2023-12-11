#include "netmodel.h"

NetModel::NetModel(INetSystem* sys,QObject *parent) : QObject(parent)
{

    m_system=sys;
    m_credentials=m_system->getConnections();
}

void NetModel::refresh()
{
    MyLogger::log("netModel","model refresh started");
    m_credentials=m_system->getConnections();
    QString log;
    foreach (InterfaceCredential cr, m_credentials) {
        log+="\t"+cr.toString()+"\n";
    }
    MyLogger::log("netModel",QString("model got net interfaces") +"length: "+QString::number(m_credentials.length()) +" :\n "+log);

    MyLogger::log("netModel","model refresh ended. Signal Emitted");
    emit declaredLengthChanged(m_credentials.length());
}

QVariant NetModel::fromId(int id)
{
    if(id>=m_credentials.length()){
        MyLogger::err("netModel",QString("ui requested entry with out-of-bound index. declared Length: %1. Requested index: %2").arg(m_credentials.length(),id));
        return QVariant::fromValue(InterfaceCredential::from("err","err","err","err",false));}
    MyLogger::log("netmodel", "ui requested credential from model. Got: "+m_credentials[id].toString());
    return QVariant::fromValue(m_credentials[id]);

}

void NetModel::setInterface(QString name, QString ip, QString mask, QString gate, bool dhcpUsed)
{
    auto interface = InterfaceCredential::from(name,ip,mask,gate,dhcpUsed);
    MyLogger::log("netModel","interface setup; Data: "+interface.toString());
    m_system->setupInterface(interface);
    refresh();
}

int NetModel::declaredLength()
{
    return m_credentials.length();
}
