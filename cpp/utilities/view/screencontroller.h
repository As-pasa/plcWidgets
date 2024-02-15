#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>
#include "headerbarmodel.h"
#include "screenview.h"
class ScreenController : public QObject
{
    Q_OBJECT
private:
    HeaderBarModel* m_headerModel;
    ScreenView* m_viewModel;
    const QList<ScreenView::Screens> ClosedHeaderStates={ScreenView::KeyboardMenu};
    void setupHeader(ScreenView::Screens screen);
public:
    explicit ScreenController(HeaderBarModel* headerModel, ScreenView* viewModel ,QObject *parent = nullptr);
public slots:
    void goToScreen(ScreenView::Screens screen);
    void prevScreen();
signals:

};

#endif // SCREENCONTROLLER_H
