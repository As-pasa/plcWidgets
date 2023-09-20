#include "interfacecredentials.h"

InterfaceCredentials::InterfaceCredentials(QString cname,
                                           QHostAddress cip,
                                           QHostAddress cmask,
                                           QHostAddress cdefaultName, bool cDHCPstatus):name(cname),ip(cip),mask(cmask),defaultGate(cdefaultName),DHCPStatus(cDHCPstatus)
{

}

InterfaceCredentials::InterfaceCredentials()
{
 name="";
 ip=QHostAddress("0.0.0.0");
 mask=QHostAddress("0.0.0.0");
 defaultGate=QHostAddress("0.0.0.0");
 DHCPStatus=false;
}
bool InterfaceCredentials::operator==(InterfaceCredentials &other)
{
 return name==other.name&& ip==other.ip && mask==other.mask && defaultGate==other.defaultGate;
}
