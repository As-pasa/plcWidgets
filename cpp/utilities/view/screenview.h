#ifndef SCREENVIEW_H
#define SCREENVIEW_H

#include <QObject>
#include <QMap>
#include <QDebug>

class ScreenView : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString CurrenScreen READ getCurrentScreen NOTIFY currentScreenChanged)
    explicit ScreenView(QObject *parent = nullptr);
    enum Screens{
        TopMenu=1,
        NetMenu=2,
        BaseMenu=3,
        FileMenu=4,
        TimeMenu=5,
        DateSubmenu=6,
        TimeZoneSubmenu=7,
        AboutMenu=8,
        ExportMenu=9,
        ImportMenu=10,
        ImportDirSubmenu=11,
        WifiMenu=12,
        NetInterfaceMenu=13,
        PingMenu=14,
        DisplayMenu=15
    };
    Q_ENUM(Screens)
    const static QMap<Screens,QString> ScreenToStateName;
private:
    QString currentScreen=ScreenToStateName[TopMenu];
public slots:
    QString getScreen(Screens name);
    QString getCurrentScreen();
    void setCurrentScreen(Screens n);
signals:
void currentScreenChanged(QString);
};

#endif // SCREENVIEW_H
