#include "screenview.h"

const QMap<ScreenView::Screens,ScreenView::ScreenInfo> ScreenView::ScreenToInfo={
    {ScreenView::TopMenu,{"Top Level Menu","$version",""}},
    {ScreenView::NetMenu,{"Network Menu","Network123",""}},
    {ScreenView::BaseMenu,{"Base Menu","Settings",""}},
    {ScreenView::FileMenu,{"File Menu","Backup",""}},
    {ScreenView::TimeMenu,{"Time Menu","Time",""}},
    {ScreenView::DateSubmenu,{"Date Time Submenu","Datetime",""}},
    {ScreenView::TimeZoneSubmenu,{"Time Zone Submenu","Timezone",""}},
    {ScreenView::AboutMenu,{"About Device Submenu","About",""}},
    {ScreenView::ExportMenu,{"File Export Menu","Export",""}},
    {ScreenView::ImportMenu,{"File Import Menu","Import",""}},
    {ScreenView::ImportDirSubmenu, {"Import Directory Selection Menu","Import",""}},
    {ScreenView::WifiMenu,{"Wifi Configuration Menu","Wifi",""}},
    {ScreenView::NetInterfaceMenu,{"Network Interface Selection Menu","Net",""}},
    {ScreenView::PingMenu,{"Ping Menu","Ping",""}},
    {ScreenView::DisplayMenu,{"Display Menu","Display",""}}

};



ScreenView::ScreenView(QObject *parent) : QObject(parent)
{
    m_screenHistory.push(currentScreen);
}

ScreenView::Screens ScreenView::getPreviousScreen()
{
    return m_screenHistory.top();
}

void ScreenView::switchToPreviousScreen()
{
   if(m_screenHistory.top()==TopMenu){
       return;
   }
   m_screenHistory.pop();
   setCurrentScreen(m_screenHistory.pop());
}

QString ScreenView::getScreen(Screens name)
{
    return ScreenToInfo[name].stateName;
}

QString ScreenView::getScreenShortName(ScreenView::Screens name)
{
    return ScreenToInfo[name].shortName;
}

QString ScreenView::getCurrenScreenShortName()
{
    return getScreenShortName(currentScreen);
}

QString ScreenView::getCurrentScreen()
{
    return ScreenToInfo[currentScreen].stateName;
}

void ScreenView::setCurrentScreen(Screens n)
{

    m_screenHistory.push(n);
    currentScreen=n;
    emit currentScreenChanged(getScreen( currentScreen));
    emit ScreenShortNameChanged(ScreenToInfo[currentScreen].shortName);
}


