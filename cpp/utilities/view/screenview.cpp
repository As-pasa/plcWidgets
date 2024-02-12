#include "screenview.h"

ScreenView::ScreenView(QObject *parent) : QObject(parent)
{

}

QString ScreenView::getScreen(Screens name)
{
    qDebug()<<ScreenToStateName[Screens::NetMenu];
    qDebug()<< name << " " << ScreenToStateName[name];
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
    qDebug()<<"Screen switched: "<<currentScreen<< " by "<<n;
}
const QMap<ScreenView::Screens, QString> ScreenView::ScreenToStateName={
    {ScreenView::TopMenu,"TopLevelMenu"},
    {NetMenu,"NetworkMenu"},
    {BaseMenu,"BaseMenu"},
    {FileMenu,"FileMenu"},
    {TimeMenu,"TimeMenu"},
    {DateSubmenu,"DateTimeSubmenu"},
    {TimeZoneSubmenu,"TimeZoneSubmenu"},
    {AboutMenu,"AboutDeviceSubmenu"},
    {ExportMenu,"FileExportMenu"},
    {ImportMenu,"FileImportMenu"},
    {ImportDirSubmenu, "ImportDirectorySelectionMenu"},
    {WifiMenu,"WifiConfigurationMenu"},
    {NetInterfaceMenu,"NetInterfaceSelectionMenu"},
    {PingMenu,"PingMenu"},
    {DisplayMenu,"DisplayMenu"}
};
