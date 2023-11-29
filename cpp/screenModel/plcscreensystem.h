#ifndef PLCSCREENSYSTEM_H
#define PLCSCREENSYSTEM_H
#include "iscreensystem.h"
#include <QObject>
#include <QFile>
#include <QDebug>
#include <QProcess>
#include "../utilities/os.h"
class plcScreenSystem:public IScreenSystem
{
public:

    plcScreenSystem();
private:
    QString m_configPath="B:/coding/matemp/screen.conf.txt";
    QString m_fileSetterPath="B:/coding/matemp/brightness.txt";
    QString m_maxBrightnessPath="B:/coding/matemp/max_brightness.txt";

    int maxBr=0;
    // IScreenSystem interface
public:
    int curBr=0;
    void setScreenBrightness(int value);
    int getCurrentScreenBrightness();
    void calibrate();
};

#endif // PLCSCREENSYSTEM_H
