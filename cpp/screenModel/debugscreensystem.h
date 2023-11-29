#ifndef DEBUGSCREENSYSTEM_H
#define DEBUGSCREENSYSTEM_H

#include "iscreensystem.h"
#include <QDebug>
class DebugScreenSystem:public IScreenSystem
{
public:
    DebugScreenSystem();
    int m_brightness=50;
    int m_maxBrightness=100;

    // IScreenSystem interface
public:
    void setScreenBrightness(int value);

    void calibrate();

    // IScreenSystem interface
public:
    int getCurrentScreenBrightness();

};

#endif // DEBUGSCREENSYSTEM_H
