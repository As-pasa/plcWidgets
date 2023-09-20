#ifndef DEVICEINFOMODEL_H
#define DEVICEINFOMODEL_H

#include <QString>
class DeviceInfoModel
{
public:
    DeviceInfoModel();
    QString getDeviceName();
    QString getDeviceType();
    QString getDeviceFirmware();
    QString getFirmwareDate();
    QString getFirmwareVersion();
};

#endif // DEVICEINFOMODEL_H
