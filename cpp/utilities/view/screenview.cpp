#include "screenview.h"

const QMap<int,ScreenView::ScreenInfo> ScreenView::ScreenToInfo={
    {ScreenView::TopMenu,{"Top Level Menu","Version: 2.0",""}},
    {ScreenView::NetMenu,{"Network Menu","Network",""}},
    {ScreenView::BaseMenu,{"Base Menu","Settings",""}},
    {ScreenView::FileMenu,{"File Menu","Backup",""}},
    {ScreenView::TimeMenu,{"Time Menu","Time",""}},
    {ScreenView::DateSubmenu,{"Date Time Submenu","Datetime",""}},
    {ScreenView::TimeZoneSubmenu,{"Time Zone Submenu","Timezone",""}},
    {ScreenView::AboutMenu,{"About Device Submenu","About",""}},
    {ScreenView::ExportDeviceSelect,{"File Export Menu","Export",""}},
    {ScreenView::ImportMenu,{"File Import Menu","Import",""}},
    {ScreenView::ImportDirSubmenu, {"Import Directory Selection Menu","Import",""}},
    {ScreenView::WifiMenu,{"Wifi Configuration Menu","Wifi",""}},
    {ScreenView::NetInterfaceMenu,{"Network Interface Selection Menu","Net",""}},
    {ScreenView::PingMenu,{"Ping Menu","Ping",""}},
    {ScreenView::DisplayMenu,{"Display Menu","Brightness",""}},
    {ScreenView::PasswordMenu,{"Password Menu","Password",""}},
    {ScreenView::PasswordRecovery,{"Password Recovery Menu","Recovery",""}},
    {ScreenView::AppMessager,{"Application info menu","Info",""}},
    {ScreenView::DayInput,{"Day input menu","Day",""}},
    {ScreenView::MonthInput,{"Month input menu","Month",""}},
    {ScreenView::YearInput,{"Year input menu","Year",""}},
    {ScreenView::MinuteInput,{"Minute input menu","Minute",""}},
    {ScreenView::HourInput,{"Hour input menu","Hour",""}},
    {ScreenView::TimeZoneInput,{"Time zone input","Time zone",""}},
    {ScreenView::NetInterfaceView,{"Interface view","interface view",""}},
    {ScreenView::NetInterfaceEdit,{"Interface edit","interface edit",""}},
    {ScreenView::IpInput,{"Ip input","Ip input",""}},
    {ScreenView::MaskInput,{"Mask input","Mask input",""}},
    {ScreenView::GateInput,{"Gate input","Gate input",""}},
    {ScreenView::PasswordInput,{"Password input","Password input",""}},
    {ScreenView::ImportDeviceSelection,{"Device selection screen","Device selection",""}},
    {ScreenView::ImportConfirm,{"Confirm password for import","Password confirm",""}},
    {ScreenView::ImportFileSelectionScreen,{"Import folder selection","Select folder",""}},
    {ScreenView::ExportConfirm, {"Confirm password for export","Password confirm",""}},
    {ScreenView::PasswordInstallConfirm,{"Password install confirmation","password install confirm",""}},
    {ScreenView::PasswordInstallScreen,{"Password install input","password install",""}},

};

ScreenView::ScreenView(QObject *parent) : QObject(parent)
{
    m_screenHistory.push(currentScreen);
}

int ScreenView::ScreenToId(ScreenView::Screens screen)
{
    return screen;
}

int ScreenView::getPreviousScreen()
{
    return m_screenHistory.top();
}

void ScreenView::switchToPreviousScreen()
{
   if(m_screenHistory.top()==TopMenu){
       currentScreen=TopMenu;
       emit(currentScreenChanged(getScreen(currentScreen)));
       emit ScreenShortNameChanged(ScreenToInfo[currentScreen].shortName);
       return;
   }
   currentScreen= m_screenHistory.pop();
   emit(currentScreenChanged(getScreen(currentScreen)));
   emit ScreenShortNameChanged(ScreenToInfo[currentScreen].shortName);

}

QString ScreenView::getScreen(int name)
{
    return ScreenToInfo[name].stateName;
}

QString ScreenView::getScreenShortName(int name)
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

void ScreenView::setCurrentScreen(int n)
{
    m_screenHistory.push(currentScreen);
    currentScreen=n;
    emit currentScreenChanged(getScreen(currentScreen));
    emit ScreenShortNameChanged(ScreenToInfo[currentScreen].shortName);
}


