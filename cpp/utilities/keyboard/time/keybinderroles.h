#ifndef KEYBINDERROLES_H
#define KEYBINDERROLES_H

#include <QObject>

class KeyBinderRoles : public QObject
{
    Q_OBJECT
public:
    explicit KeyBinderRoles(QObject *parent = nullptr);
    enum TimeRoles{
        Minute=1,
        Hour=2,
        Day=3,
        Month=4,
        Year=5
    };
    enum InterfaceRoles{
        Ip=6,
        Mask=7,
        Gate=8,
        PingIp=10
    };
    enum PasswordRoles{
        Password=9,
        WifiPassword=11
    };

    Q_ENUM(InterfaceRoles)
    Q_ENUM(PasswordRoles)
    Q_ENUM(TimeRoles)
signals:

};

#endif // KEYBINDERROLES_H
