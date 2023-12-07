#ifndef SCREENMODEL_H
#define SCREENMODEL_H

#include "iscreensystem.h"
#include "cpp/utilities/confirmationDisplayer/commandconfirmator.h"
#include <QObject>
#include <QtMath>
#include <QDebug>
#include <QThread>
class ScreenModel:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int brightness READ brightness WRITE setBrightness NOTIFY brightnessChanged)
public:
    ScreenModel(IScreenSystem* system, CommandConfirmator* confirmator);

private:
    IScreenSystem* m_system;
    CommandConfirmator* m_confirmator;
    class CalibrateConfirmation:public Confirmable{

        ScreenModel * m_model;
        // Confirmable interface
    public:
        CalibrateConfirmation(ScreenModel* m);
        QString getDescription();
        void accept();
    };


public:
    void setBrightness(int value);
    int brightness();

public slots:
    void calibrate();
    void innerCalibrate();
signals:
    void brightnessChanged(int value);
    void calibrationStarted();
    void calibrationEnded();


};

#endif // SCREENMODEL_H
