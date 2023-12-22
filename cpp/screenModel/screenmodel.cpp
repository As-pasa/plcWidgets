#include "screenmodel.h"



ScreenModel::ScreenModel(IScreenSystem *system, CommandConfirmator *confirmator)
{
    m_system=system;
    m_confirmator=confirmator;
    MyLogger::log("screenModel","model construction ended successfully");
}

void ScreenModel::setBrightness(int value)
{
    MyLogger::log("screenModel","UI attempted to set brightness: "+QString::number(value));
    m_system->setScreenBrightness(value);
    emit brightnessChanged(value);
    MyLogger::log("screenModel","signal emitted: brightnessChanged");

}

int ScreenModel::brightness()
{
    auto a = m_system->getCurrentScreenBrightness();
    MyLogger::log("screenModel","UI requesteed brightness value, returning: "+QString::number(a));
    return a;
}

void ScreenModel::calibrate()
{
    //m_confirmator->enqueue(new CalibrateConfirmation(this));
    emit calibrationStarted();
    MyLogger::log("screenModel","signal emitted: calibration started");
}

void ScreenModel::innerCalibrate()
{
    MyLogger::log("screenModel","calibration PROCEDURE STARTED");
    m_system->calibrate();
    emit calibrationEnded();
    MyLogger::log("screenModel","calibration PROCEDURE ENDED, SIGNAL EMITTED");

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
