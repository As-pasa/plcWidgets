#include "plcdevicesystem.h"

PlcDeviceSystem::PlcDeviceSystem()
{

}

QString PlcDeviceSystem::getDeviceName()
{
    return checkGet("DeviceName");
}

QString PlcDeviceSystem::getDeviceType()
{
    return checkGet("DeviceType");
}

QString PlcDeviceSystem::getFirmware()
{
    return checkGet("DeviceFirmware");
}

QString PlcDeviceSystem::getFirmWareSettleTimeStamp()
{
    return checkGet("DeviceFirmwareTimeStamp");
}

QString PlcDeviceSystem::getFirmwareVersion()
{
    return checkGet("DeviceFirmwareVersion");
}


QMap<QString,QString> PlcDeviceSystem::collectData(){
    QString output;
    QMap<QString,QString> ans;

    if(!os::readFromFile(pathToConfig,output)){
        qDebug()<<"error while reading config file(devinfo collect data)";
    }

    QStringList records = output.split("\n");
    foreach(QString rec, records){

        QStringList lineData = rec.split(" ");

        if(lineData.length()==2) ans[lineData[0]]=lineData[1];
    }
    return ans;
}

QString PlcDeviceSystem::checkGet(QString key)
{
    if(!m_data.keys().contains(key)){
        m_data=collectData();
    }
    if(!m_data.keys().contains(key)){
        qDebug()<< key;
        return "Undefined";
    }
    return m_data[key];
}
