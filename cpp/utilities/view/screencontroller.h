#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>
#include <QMap>
#include "headerbarmodel.h"
#include "screenview.h"
#include "cpp/passwordModel/passwordmodel.h"
class ScreenController : public QObject
{
    Q_OBJECT
private:
    HeaderBarModel* m_headerModel;
    ScreenView* m_viewModel;
    PasswordModel* m_password;
    static const QMap<int,int> ClosedHeaderStates;
    void setupHeader(int screen);
public:
    explicit ScreenController(HeaderBarModel* headerModel, ScreenView* viewModel, PasswordModel* passwordm ,QObject *parent = nullptr);
public slots:
    void goToScreen(int screen);
    void prevScreen();
    void submitPassword(QString password);
signals:

};

#endif // SCREENCONTROLLER_H
