#include "screencontroller.h"



void ScreenController::setupHeader(int screen)
{
    if(ClosedHeaderStates.keys().contains(screen)){

        m_headerModel->setState(ClosedHeaderStates[screen]);
    }
    else{
        m_headerModel->setState(HeaderBarModel::Opened);
    }

}

ScreenController::ScreenController(HeaderBarModel *headerModel,
                                   ScreenView *viewModel,
                                   PasswordModel* passwordm,
                                   MessageDisplayer* messager,
                                   NetInterfaceInputState* netKeyboardInput,
                                   QObject *parent)
{
    m_headerModel=headerModel;
    m_messager=messager;
    m_viewModel=viewModel;
    m_password=passwordm;
    m_netKeyboardInput=netKeyboardInput;
}

void ScreenController::goToScreen(int screen)
{
    if(securedScreens.contains(screen)){

        startGateValidation(screen);

    }else{
        setupHeader(screen);
        m_viewModel->setCurrentScreen(screen);
    }
}

void ScreenController::prevScreen()
{


    auto prevScreenv =  m_viewModel->getPreviousScreen();
    if(prevScreenv==ScreenView::Screens::PasswordInput &&
            m_viewModel->getCurrentScreen()!=m_viewModel->getScreen( ScreenView::Screens::AppMessager)){
        setupHeader(prevScreenv);
        m_viewModel->switchToPreviousScreen();
        prevScreen();
    }else{
        setupHeader(prevScreenv);
        m_viewModel->switchToPreviousScreen();
    }

}

void ScreenController::openTheGate()
{
    setupHeader(gatewayTarget);
    m_viewModel->setCurrentScreen(gatewayTarget);
}

void ScreenController::startGateValidation(int to)
{
    gatewayTarget=to;
    goToScreen(ScreenView::PasswordInput);
}

void ScreenController::submitPassword(QString password)
{
    if(m_password->checkPassword(password)){
        goToScreen(ScreenView::TopMenu);
    }

}

void ScreenController::showInfoWithText(QString text)
{
    goToScreen(ScreenView::AppMessager);
    m_messager->showMessage(text);
}

void ScreenController::openNetInterfaceEditMenu(QString netInterfaceName, QString startIp, QString startMask, QString startGate)
{
    m_netKeyboardInput->setName(netInterfaceName);
    m_netKeyboardInput->setIp(startIp);
    m_netKeyboardInput->setMask(startMask);
    m_netKeyboardInput->setGate(startGate);
    goToScreen(ScreenView::NetInterfaceEdit);
}





const QMap<int,int> ScreenController::ClosedHeaderStates={
    {ScreenView::DayInput, HeaderBarModel::Closed},
    {ScreenView::MonthInput, HeaderBarModel::Closed},
    {ScreenView::YearInput, HeaderBarModel::Closed},
    {ScreenView::MinuteInput, HeaderBarModel::Closed},
    {ScreenView::HourInput, HeaderBarModel::Closed},
    {ScreenView::PasswordMenu,HeaderBarModel::Password},
    {ScreenView::IpInput, HeaderBarModel::Closed},
    {ScreenView::MaskInput, HeaderBarModel::Closed},
    {ScreenView::GateInput,HeaderBarModel::Closed},
    {ScreenView::PasswordInput,HeaderBarModel::Closed},
    {ScreenView::ImportConfirm,HeaderBarModel::Closed},
    {ScreenView::ExportConfirm,HeaderBarModel::Closed},
    {ScreenView::PasswordInstallConfirm,HeaderBarModel::Closed}
};


const QList<int> ScreenController::securedScreens={
};
