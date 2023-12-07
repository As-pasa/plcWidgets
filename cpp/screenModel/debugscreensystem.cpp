#include "debugscreensystem.h"

DebugScreenSystem::DebugScreenSystem()
{

}

void DebugScreenSystem::setScreenBrightness(int value)
{
    qDebug()<<"Screen brigthness was set: "<<value;
    m_brightness=value;
}

void DebugScreenSystem::calibrate()
{
    qDebug()<<"Screen calibration procedure was called";

}

int DebugScreenSystem::getCurrentScreenBrightness()
{
    return m_brightness;
}




