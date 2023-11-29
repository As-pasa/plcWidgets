#ifndef SCREENMODEL_H
#define SCREENMODEL_H

#include "iscreensystem.h"
#include <QObject>
#include <QtMath>
#include <QDebug>
class ScreenModel:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int brightness READ brightness WRITE setBrightness NOTIFY brightnessChanged)
public:
    ScreenModel(IScreenSystem* system);
private:
    IScreenSystem* m_system;
public:
    void setBrightness(int value);
    int brightness();

public slots:
    void calibrate();
signals:
    void brightnessChanged(int value);
    void calibrationEnded();


};

#endif // SCREENMODEL_H
