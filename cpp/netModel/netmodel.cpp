#include "netmodel.h"

NetModel::NetModel(INetSystem* sys,QObject *parent) : QObject(parent)
{

    m_system=sys;
    foreach(InterfaceCredential a,m_system->getConnections()){

        m_credentials[a.name]=a;


    }
}

void NetModel::refresh()
{
    MyLogger::log("netModel","model refresh started");
    foreach(InterfaceCredential a,m_system->getConnections()){

        m_credentials[a.name]=a;


    }
    QString log;
    foreach (InterfaceCredential cr, m_credentials.values()) {
        log+="\t"+cr.toString()+"\n";
    }
    MyLogger::log("netModel",QString("model got net interfaces") +"length: "+QString::number(m_credentials.keys().length()) +" :\n "+log);

    MyLogger::log("netModel","model refresh ended. Signal Emitted");
    emit declaredLengthChanged(m_credentials.keys().length());
}

QVariant NetModel::fromName(QString name)
{
    if(!m_credentials.keys().contains(name)){
        MyLogger::err("netModel",QString("ui requested entry with out-of-bound index. Requested name: %1").arg(name));
        return QVariant::fromValue(InterfaceCredential::from("err","err","err","err",false));}
    MyLogger::log("netmodel", "ui requested credential from model. Got: "+m_credentials[name].toString());
    return QVariant::fromValue(m_credentials[name]);

}

void NetModel::setInterface(QString name, QString ip, QString mask, QString gate, bool dhcpUsed)
{
    auto interface = InterfaceCredential::from(name,ip,mask,gate,dhcpUsed);
    qDebug()<<dhcpUsed;
    MyLogger::log("netModel","interface setup; Data: "+interface.toString());
    m_system->setupInterface(interface);
    refresh();
}

QStringList NetModel::declaredInterfaces()
{
    return m_credentials.keys();
}

QString NetModel::getCurrentSelectedInterface()
{
    return currentSelectedInterface;
}

void NetModel::setCurrentSelectedInterface(QString n)
{
    currentSelectedInterface=n;
    emit currentSelectedInterfaceChanged(n);
}

int NetModel::declaredLength()
{
    return m_credentials.keys().length();
}
