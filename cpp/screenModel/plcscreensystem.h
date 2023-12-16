#ifndef PLCSCREENSYSTEM_H
#define PLCSCREENSYSTEM_H
#include "iscreensystem.h"
#include <QObject>
#include <QFile>
#include <QDebug>
#include <QProcess>
#include "../utilities/os.h"
#include "../utilities/mylogger.h"
class plcScreenSystem:public IScreenSystem
{
public:

    plcScreenSystem();
private:
    QString m_configPath="/etc/plcconf/brightness";
    QString m_fileSetterPath="/sys/devices/platform/backlight/backlight/backlight/brightness";
    QString m_maxBrightnessPath="/sys/devices/platform/backlight/backlight/backlight/max_brightness";

    int maxBr=0;
    // IScreenSystem interface
public:
    int curBr=0;
    void setScreenBrightness(int value);
    int getCurrentScreenBrightness();
    void calibrate();
};

#endif // PLCSCREENSYSTEM_H
