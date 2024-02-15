#ifndef SCREENVIEW_H
#define SCREENVIEW_H

#include <QObject>
#include <QMap>
#include <QDebug>
#include <QStack>
class ScreenView : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString CurrenScreen READ getCurrentScreen NOTIFY currentScreenChanged)
    Q_PROPERTY(QString ShortScreenName READ getCurrenScreenShortName NOTIFY ScreenShortNameChanged)
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
        DisplayMenu=15,
        KeyboardMenu=16
    };
    struct ScreenInfo{
        QString stateName;
        QString shortName;
        QString iconPath;

    };

    Q_ENUM(Screens)


private:
    Screens currentScreen=TopMenu;
    QStack<Screens> m_screenHistory;

    const static QMap<Screens,ScreenInfo> ScreenToInfo;

public slots:
    Screens getPreviousScreen();
    void switchToPreviousScreen();
    QString getScreen(Screens name);
    QString getScreenShortName(Screens name);
    QString getCurrenScreenShortName();
    QString getCurrentScreen();
    void setCurrentScreen(Screens n);
signals:
void currentScreenChanged(QString);
void ScreenShortNameChanged(QString);
};

#endif // SCREENVIEW_H
