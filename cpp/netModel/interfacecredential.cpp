#include "interfacecredential.h"



QString InterfaceCredential::toString()
{
    auto s ="None";
    if(DHCPUsed){s="USED";}
    return QString("name: %1  ip: %2 mask: %3 gate: %4 dhcp: %5").arg(name,ip,mask,gate,s);
}

InterfaceCredential InterfaceCredential::from(QString c_name, QString c_ip, QString c_mask, QString c_gate, bool DHCP)
{
    InterfaceCredential cred;
    cred.name=c_name;
    cred.ip=c_ip;
    cred.mask=c_mask;
    cred.gate=c_gate;
    cred.DHCPUsed=DHCP;
    return cred;
}
