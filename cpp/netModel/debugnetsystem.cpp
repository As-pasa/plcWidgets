#include "debugnetsystem.h"

DebugNetSystem::DebugNetSystem()
{
    m_innerCons.append(InterfaceCredential::from("lan0","1.1.1.1","255.255.255.0","2.2.2.2",false));
    m_innerCons.append(InterfaceCredential::from("lan1","123.123.123.123","255.255.255.0","3.3.3.3",true));
}

QList<InterfaceCredential> DebugNetSystem::getConnections()
{
    qDebug()<<"DEBUG Netsystem interface list requested";
    return m_innerCons;
}

void DebugNetSystem::setupInterface(InterfaceCredential cred)
{
    qDebug()<< "DEBUG Netsystem: interface setted:"<< cred.toString();
    for(int i =0; i< m_innerCons.length();i++){
        if(m_innerCons[i].name==cred.name){
            m_innerCons[i]=cred;
        }
    }

}
