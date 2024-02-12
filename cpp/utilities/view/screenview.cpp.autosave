#include "screenview.h"

ScreenView::ScreenView(QObject *parent) : QObject(parent)
{

}

QString ScreenView::getScreen(Screens name)
{
    return ScreenToStateName[name];
}

QString ScreenView::getCurrentScreen()
{
    return currentScreen;
}

void ScreenView::setCurrentScreen(Screens n)
{
    currentScreen=getScreen(n);
    emit currentScreenChanged(currentScreen);
}
const QMap<ScreenView::Screens, QString> ScreenView::ScreenToStateName={
    {ScreenView::TopMenu,"Top Level Menu"},
    {NetMenu,"Network Menu"},
    {BaseMenu,"Base Menu"},
    {FileMenu,"File Menu"},
    {TimeMenu,"Time Menu"},
    {DateSubmenu,"Date Time Submenu"},
    {TimeZoneSubmenu,"Time Zone Submenu"},
    {AboutMenu,"About Device Submenu"},
    {ExportMenu,"File Export Menu"},
    {ImportMenu,"File Import Menu"},
    {ImportDirSubmenu, "Import Directory Selection Menu"},
    {WifiMenu,"Wifi Configuration Menu"},
    {NetInterfaceMenu,"Network Interface Selection Menu"},
    {PingMenu,"Ping Menu"},
    {DisplayMenu,"Display Menu"}
};
