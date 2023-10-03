#include "screenmodel.h"

ScreenModel::ScreenModel(IScreenSystem *system)
{
    m_system=system;
    m_brightness=50;
}

void ScreenModel::setBrightness(int value)
{
    if(value!=m_brightness){
        m_brightness=value;
        m_system->setScreenBrightness(m_brightness);
        emit brightnessChanged(m_brightness);
    }
}

int ScreenModel::brightness()
{
    return m_brightness;
}

void ScreenModel::calibrate()
{
    m_system->calibrate();

}
