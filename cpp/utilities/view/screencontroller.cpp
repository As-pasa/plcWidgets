#include "screencontroller.h"

void ScreenController::setupHeader(ScreenView::Screens screen)
{
    if(ClosedHeaderStates.contains(screen)){
        m_headerModel->setState(HeaderBarModel::Closed);

    }
    else{
        m_headerModel->setState(HeaderBarModel::Opened);
    }

}

ScreenController::ScreenController(HeaderBarModel *headerModel, ScreenView *viewModel, QObject *parent)
{
    m_headerModel=headerModel;
    m_viewModel=viewModel;
}

void ScreenController::goToScreen(ScreenView::Screens screen)
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
