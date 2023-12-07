#include "screenmodel.h"



ScreenModel::ScreenModel(IScreenSystem *system, CommandConfirmator *confirmator)
{
    m_system=system;
    m_confirmator=confirmator;
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
    //m_confirmator->enqueue(new CalibrateConfirmation(this));
    emit calibrationStarted();
}

void ScreenModel::innerCalibrate()
{
    m_system->calibrate();
    emit calibrationEnded();
}

ScreenModel::CalibrateConfirmation::CalibrateConfirmation(ScreenModel *m)
{
    m_model=m;
}

QString ScreenModel::CalibrateConfirmation::getDescription()
{
    return "During calibration, tap on labels\n in numeric order to perform calibration. Proceed?";
}

void ScreenModel::CalibrateConfirmation::accept()
{
    m_model->innerCalibrate();
}
