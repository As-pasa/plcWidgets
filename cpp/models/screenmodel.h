#ifndef SCREENMODEL_H
#define SCREENMODEL_H

#include "../systems/iscreensystem.h"
#include <QObject>
class ScreenModel:public QObject
{
    Q_OBJECT
public:
    ScreenModel(IScreenSystem* system);
private:
    IScreenSystem* m_system;
    int m_brightness;
public:
    void setBrightness(int value);
    int getBrightness();
    void calibrate();
signals:
    void brightnessChanged(int value);
    void calibrationPerformed();

};

#endif // SCREENMODEL_H
