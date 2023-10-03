#ifndef SCREENMODEL_H
#define SCREENMODEL_H

#include "../systems/iscreensystem.h"
#include <QObject>
class ScreenModel:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int brightness READ brightness WRITE setBrightness NOTIFY brightnessChanged)
public:
    ScreenModel(IScreenSystem* system);
private:
    IScreenSystem* m_system;
    int m_brightness;
public:
    void setBrightness(int value);
    int brightness();

public slots:
    void calibrate();
signals:
    void brightnessChanged(int value);


};

#endif // SCREENMODEL_H
