#ifndef PLCSCREENSYSTEM_H
#define PLCSCREENSYSTEM_H

#include <QString>
#include "iscreensystem.h"
#include "../utilities/os.h"
#include <QtGlobal>
#include <QProcess>
#include <QFile>
#include <QTextStream>
class PLCScreenSystem:public IScreenSystem
{
public:
    PLCScreenSystem();

    // IScreenSystem interface
public:
    void setScreenBrightness(int value);
    void calibrate();
private:
    QString getCurrentDisplay();
};

#endif // PLCSCREENSYSTEM_H
