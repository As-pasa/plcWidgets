#include "plcwifisystem.h"




PLCWifiSystem::PLCWifiSystem()
{

}

void PLCWifiSystem::setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt)
{

    QFile wifi;
    QString ssid;
    QString psk;
    QString key_mgmt = "WPA-PSK";

    ssid = wifiName;
    psk = wifiPassword;
    if (null_mgmt) key_mgmt= "NONE";

    const QString conn_command = "wpa_supplicant -c/etc/wpa_supplicant.conf -iwlan0 -Dnl80211 -B";

    //for plc
   wifi.setFileName("/etc/wpa_supplicant.conf");
    //for pc
  //  wifi.setFileName("/home/bustaz/test/wpa_supplicant.conf");

    if (!wifi.open(QIODevice::ReadWrite | QIODevice::Text)) return; // не удалось открыть файл
    QTextStream txt(&wifi);
    wifi.resize(0);

    txt << "ctrl_interface=/var/run/wpa_supplicant\n";
    txt <<"ctrl_interface_group=0\n";
    txt <<"update_config=1\n";
    txt <<"\n";
    txt <<"network={\n";
    txt <<"     ssid=\"" << ssid <<"\"\n";
    txt <<"     psk=\"" << psk <<"\"\n";
    txt <<"     key_mgmt=" << key_mgmt << "\n";
    txt << "}";

    wifi.close();

    //Включить после отладки
    QProcess proc;
    proc.start(conn_command);
}

QList<WifiConnection> PLCWifiSystem::getWifiConnections()
{
    QList<WifiConnection> answer;

    QStringList number;
    QStringList name;
    QStringList freq;
    QStringList bssid;
    QStringList secure;
    QStringList signal1;


    QString command1 = "iw dev wlan0 scan";
    QString command2 = "grep SSID\\|BSS\\|freq\\|signal\\|capability";

    QProcess proc;
    QProcess grep;
    QString output;
    proc.setStandardOutputProcess(&grep);
    proc.start(command1);
    grep.start(command2);
    proc.waitForFinished(10000);
    grep.waitForFinished(5000);

    output = (grep.readAllStandardOutput());
    output = (output + grep.readAllStandardError());

    bool ttt;

     QRegExp rxssid("SSID: ([^\\|\\r|\\v|\\\\|\\t]+)");
     QRegExp rxfreq("freq: ([^\\|\\r|\\v|\\\\|\\t|\\n]+)");
     QRegExp rxbbs("BSS (\\w{2}:\\w{2}:\\w{2}:\\w{2}:\\w{2}:\\w{2})");
     QRegExp rxsec("ESS [\\w+\\s+]+[\\(](0x\\w{4})");
     QRegExp rxsign("signal: (-\\d{1,3})");

     name.clear();
     freq.clear();
     secure.clear();
     bssid.clear();
     signal1.clear();

    int pos = 0;
     while ((pos = rxssid.indexIn(output, pos)) != -1) {
        name << rxssid.cap(1);
        pos += rxssid.matchedLength();
     }
    pos = 0;
    while ((pos = rxfreq.indexIn(output, pos)) != -1) {
        freq << rxfreq.cap(1);
        pos+= rxfreq.matchedLength();
    }
    pos = 0;
    while ((pos = rxsign.indexIn(output, pos)) != -1) {
        signal1 << rxsign.cap(1);
        pos += rxsign.matchedLength();
    }
    pos = 0;
    while ((pos = rxbbs.indexIn(output, pos)) != -1) {
        bssid << rxbbs.cap(1);
        pos += rxbbs.matchedLength();
    }
    pos = 0;
    while ((pos = rxsec.indexIn(output, pos)) != -1) {
        secure << rxsec.cap(1);
        pos += rxsec.matchedLength();
    }

    for(int i =0;i<name.size();i++){
        WifiConnection a("","","","","");
        if(name[i]=='\n'){a.name="hidden";}else{a.name=name[i].remove(QRegExp("\\n"));}
        if(freq[i].toUInt()<3000){a.frequency="2.4G";}else{a.frequency="5G";}
        a.signal1=signal1[i]+" dBm";
        if(secure[i].isEmpty()) a.security="Unknown"; else a.security="None";
        if(!(secure[i].toInt(&ttt,16)&0x0010)) a.security="None";else a.security="WPA-PSK";
        a.bssid=bssid[i];
        answer<<a;
    }
    return answer;
}
