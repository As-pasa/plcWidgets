#ifndef DEBUGSCREENSYSTEM_H
#define DEBUGSCREENSYSTEM_H

#include "iscreensystem.h"
#include <QDebug>
class DebugScreenSystem:public IScreenSystem
{
public:
    DebugScreenSystem();

    // IScreenSystem interface
public:
    void setScreenBrightness(int value);

    void calibrate();
};

#endif // DEBUGSCREENSYSTEM_H
