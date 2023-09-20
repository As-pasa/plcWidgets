#include "debugscreensystem.h"

DebugScreenSystem::DebugScreenSystem()
{

}

void DebugScreenSystem::setScreenBrightness(int value)
{
    qDebug()<<"Screen brigthness was set: "<<value;
}

void DebugScreenSystem::calibrate()
{
    qDebug()<<"Screen calibration procedure was called";
}


