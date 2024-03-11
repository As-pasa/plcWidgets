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
        ExportDeviceSelect=9,
        ImportMenu=10,
        ImportDirSubmenu=11,
        WifiMenu=12,
        NetInterfaceMenu=13,
        PingMenu=14,
        DisplayMenu=15,
        LogInScreen=17,
        PasswordRecovery=18,
        AppMessager=19,
        DayInput=20,
        MonthInput=21,
        YearInput=22,
        MinuteInput=23,
        HourInput=24,
        TimeZoneInput=25,
        NetInterfaceView=26,
        NetInterfaceEdit=27,
        IpInput=28,
        MaskInput=29,
        GateInput=30,
        PasswordInput=31,
        ImportDeviceSelection=32,
        ImportConfirm=33,
        ImportFileSelectionScreen=34,
        ExportConfirm=35,
        PasswordInstallConfirm=36,
        PasswordInstallScreen=37,
        LogInConfirm=38,
        PingIpInputScreen=39




    };

    struct ScreenInfo{
        QString stateName;
        QString shortName;
        QString iconPath;

    };

    Q_ENUM(Screens)


private:
    int currentScreen=TopMenu;
    QStack<int> m_screenHistory;

    const static QMap<int,ScreenInfo> ScreenToInfo;

public slots:
    int ScreenToId(Screens screen);
    int getPreviousScreen();
    void switchToPreviousScreen();
    QString getScreen(int name);
    QString getScreenShortName(int name);
    QString getCurrenScreenShortName();
    QString getCurrentScreen();
    void setCurrentScreen(int n);
signals:
void currentScreenChanged(QString);
void ScreenShortNameChanged(QString);
};

#endif // SCREENVIEW_H
