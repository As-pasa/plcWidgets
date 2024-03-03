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
                                   QObject *parent)
{
    m_headerModel=headerModel;
    m_messager=messager;
    m_viewModel=viewModel;
    m_password=passwordm;
}

void ScreenController::goToScreen(int screen)
{

    setupHeader(screen);
    m_viewModel->setCurrentScreen(screen);
}

void ScreenController::prevScreen()
{

    auto prevScreen =  m_viewModel->getPreviousScreen();
    setupHeader(prevScreen);
    m_viewModel->switchToPreviousScreen();
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

const QMap<int,int> ScreenController::ClosedHeaderStates={
  {ScreenView::KeyboardMenu, HeaderBarModel::Closed},
  {ScreenView::PasswordMenu,HeaderBarModel::Password}
};
