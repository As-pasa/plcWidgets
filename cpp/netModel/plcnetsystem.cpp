#include "plcnetsystem.h"

PlcNetSystem::PlcNetSystem()
{

}

QHostAddress PlcNetSystem::getDefaultGateWay(QString dev, QString* pOutput)
{

    const QString getDefGateWayTempl("ip -4 route show default dev %1");

    QString out;
    bool ret =  os::System(getDefGateWayTempl.arg(dev), false, &out);

    if(pOutput) pOutput->operator+=(out);

    return ret ? QHostAddress(out.section(' ', 2, 2)) : QHostAddress::Null;
}
bool PlcNetSystem::getDefdhcp(const QString dev, QString* pOutput)
{

    const QString getDefGateWayTempl("ip -4 route show default dev %1");
    QString out;
    bool ret = os::System(getDefGateWayTempl.arg(dev), false, &out);
    if(pOutput) pOutput->operator+=(out);

    //qDebug() << out;

    return ret ? out.contains("dhcp") : false;

}



QList<InterfaceCredential> PlcNetSystem::getConnections()
{
    MyLogger::log("netSystem","interface list requested");
    QList<InterfaceCredential> ans;
    for(const auto& netIf : QNetworkInterface::allInterfaces())
    {
       // if(netIf.type() != QNetworkInterface::Ethernet) continue;

        for(const auto& addrEnt : netIf.addressEntries())
        {

            if(addrEnt.ip().protocol() == QAbstractSocket::IPv4Protocol)
            {

                InterfaceCredential nInterface= InterfaceCredential::from(
                            netIf.name(),
                            addrEnt.ip().toString(),
                            addrEnt.netmask().toString(),
                            getDefaultGateWay(netIf.name(),nullptr).toString(),
                            getDefdhcp(netIf.name(),nullptr));
                    if (netIf.name() != "lo" and netIf.name() != "usb0" and netIf.name() != "can0" and netIf.name() != "can1")
                ans.push_back(nInterface);
                break;
            }
        }
        }

    return ans;
}

void PlcNetSystem::setupInterface(InterfaceCredential cred)
{
    MyLogger::log("netSystem","interface setup: "+cred.toString());
    QString fileName;
    //for pc ***************отключить после отладки
   // if (newIf.name == "enp0s3") fileName = "/home/bustaz/test/network";
  //  else if (newIf.name == "docker0") fileName = "/home/bustaz/test/network1";
    //for plc ***************включить после отладки
    if (cred.name == "eth0")  fileName = "/etc/systemd/network/10-eth.network";
    else if (cred.name == "wlan0") fileName = "/etc/systemd/network/30-wlan.network";

    QFile data(fileName);
    if(!data.open(QFile::WriteOnly | QFile::Truncate)) return;
    data.resize(0);
    QTextStream txt(&data);

    txt << "[Match]\nName=" << cred.name << "\nKernelCommandLine=!root=/dev/nfs\n[Network]\n";

    if(cred.DHCPUsed)
    {
        txt << "DHCP=yes\n[DHCP]\nRouteMetric=1024\n";
    }
    else
    {
        QString prefix = QString::number(QHostAddress::parseSubnet(cred.ip+  "/" + cred.mask).second);
        txt << "Address=" << cred.ip << "\\" << prefix;
        txt << "\nGateway=" << cred.gate << "\n";
    }

    data.close();
    os::System("systemctl restart systemd-networkd",true);
 }


