#include "plcnetsystem.h"

PLCNetSystem::PLCNetSystem()
{

}

void PLCNetSystem::setNetInterfaceCredentials(InterfaceCredentials &credentials)
{


    QString fileName;
    //for pc ***************отключить после отладки
   // if (newIf.name == "enp0s3") fileName = "/home/bustaz/test/network";
  //  else if (newIf.name == "docker0") fileName = "/home/bustaz/test/network1";
    //for plc ***************включить после отладки
     if (credentials.name == "eth0")  fileName = "/etc/systemd/network/10-eth.network";
    else if (credentials.name == "wlan0") fileName = "/etc/systemd/network/30-wlan.network";

    QFile data(fileName);
    if(!data.open(QFile::WriteOnly | QFile::Truncate)) return;
    data.resize(0);
    QTextStream txt(&data);

    txt << "[Match]\nName=" << credentials.name << "\nKernelCommandLine=!root=/dev/nfs\n[Network]\n";

    if(credentials.DHCPStatus==true)
    {
        txt << "DHCP=yes\n[DHCP]\nRouteMetric=1024\n";
    }
    else
    {
        QString prefix = QString::number(QHostAddress::parseSubnet(credentials.ip.toString()+  "/" + credentials.mask.toString()).second);
        txt << "Address=" << credentials.ip.toString() << "\\" << prefix;
        txt << "\nGateway=" << credentials.defaultGate.toString() << "\n";
    }

    data.close();
}

QMap<QString, InterfaceCredentials> PLCNetSystem::getNetInterfaces()
{
    QMap<QString, InterfaceCredentials> answer;


    for(const auto& netIf : QNetworkInterface::allInterfaces())
    {
       // if(netIf.type() != QNetworkInterface::Ethernet) continue;

        for(const auto& addrEnt : netIf.addressEntries())
        {
            if(addrEnt.ip().protocol() == QAbstractSocket::IPv4Protocol)
            {
                InterfaceCredentials interfaceToAdd(netIf.name(),addrEnt.ip(),addrEnt.netmask(),getDefaultGateway(netIf.name()),getDhcpStatus(netIf.name()));


                //if (netIf.name() != "lo" and netIf.name() != "docker0")

                    if (netIf.name() != "lo" and netIf.name() != "usb0" and netIf.name() != "can0" and netIf.name() != "can1")

                answer[interfaceToAdd.name]=interfaceToAdd;
                break;
            }
        }
    }

    return answer;
}

QHostAddress PLCNetSystem::getDefaultGateway(QString interfaceName)
{
    const QString getDefGateWayTempl("ip -4 route show default dev %1");
    QString out;
    bool ret = os::System(getDefGateWayTempl.arg(interfaceName), false, &out);
    return ret ? QHostAddress(out.section(' ', 2, 2)) : QHostAddress::Null;
}

bool PLCNetSystem::getDhcpStatus(QString interfaceName)
{
    const QString getDefGateWayTempl("ip -4 route show default dev %1");
    QString out;
    bool ret = os::System(getDefGateWayTempl.arg(interfaceName), false, &out);
    return ret ? out.contains("dhcp") : false;

}
