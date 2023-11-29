#ifndef PLCDEVICESYSTEM_H
#define PLCDEVICESYSTEM_H

#include <QObject>
#include <QMap>
#include "../utilities/os.h"
class PlcDeviceSystem
{

private:
    QString pathToConfig="B:/coding/matemp/devinfo.conf.txt";
    QMap<QString, QString> m_data;
    QMap<QString,QString> collectData();
    QString checkGet(QString key);
public:
    PlcDeviceSystem();
    QString getDeviceName();
    QString getDeviceType();
    QString getFirmware();
    QString getFirmWareSettleTimeStamp();
    QString getFirmwareVersion();
};

#endif // PLCDEVICESYSTEM_H
