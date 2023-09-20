#include "plcscreensystem.h"

PLCScreenSystem::PLCScreenSystem()
{

}

void PLCScreenSystem::setScreenBrightness(int value)
{
//    QString display=getCurrentDisplay();
//    const QString setBrightnessTempl("xrandr --output %1 --brightness %2");
//    os::System(setBrightnessTempl.arg(display).arg(qBound(0.0f, 1.0f*value/100, 1.0f)), false);


    QFile brightness("/sys/devices/platform/backlight/backlight/backlight/brightness");
    if (!brightness.open(QIODevice::WriteOnly  | QIODevice::Text))
            return;
    QTextStream out(&brightness);
    out <<  value;
}

void PLCScreenSystem::calibrate()
{
    QProcess proc;
    proc.start("ts_calibrate");
    proc.waitForFinished(60000);

}

QString PLCScreenSystem::getCurrentDisplay()
{
    QString out;
    if(os::System("xrandr --current", false, &out))
        return out.split('\n').filter("connected").value(0).section(' ', 0, 0);

    return QString();
}
