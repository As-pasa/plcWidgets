#include "screenmodel.h"

ScreenModel::ScreenModel(IScreenSystem *system)
{
    m_system=system;

}

void ScreenModel::setBrightness(int value)
{
    m_system->setScreenBrightness(value);
    emit brightnessChanged(value);

}

int ScreenModel::brightness()
{
    return m_system->getCurrentScreenBrightness();
}

void ScreenModel::calibrate()
{
    m_system->calibrate();
    emit calibrationEnded();
}
