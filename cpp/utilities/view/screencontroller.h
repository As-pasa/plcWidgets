#ifndef SCREENCONTROLLER_H
#define SCREENCONTROLLER_H

#include <QObject>
#include <QMap>
#include "headerbarmodel.h"
#include "screenview.h"
#include "cpp/passwordModel/passwordmodel.h"
#include "cpp/utilities/messagedisplayer.h"
#include "cpp/utilities/messagedisplayer.h"
#include "cpp/utilities/keyboard/network/netinterfaceinputstate.h"
class ScreenController : public QObject
{
    Q_OBJECT
private:
    HeaderBarModel* m_headerModel;
    ScreenView* m_viewModel;
    MessageDisplayer* m_messager;
    PasswordModel* m_password;
    NetInterfaceInputState* m_netKeyboardInput;
    static const QMap<int,int> ClosedHeaderStates;
    void setupHeader(int screen);
public:
    explicit ScreenController(HeaderBarModel* headerModel,
                              ScreenView* viewModel,
                              PasswordModel* passwordm,
                              MessageDisplayer* messager,
                              NetInterfaceInputState* netKeyboardInput,
                              QObject *parent = nullptr);
public slots:
    void goToScreen(int screen);
    void prevScreen();
    void submitPassword(QString password);
    void showInfoWithText(QString text);
    void openNetInterfaceEditMenu(QString netInterfaceName,QString startIp, QString startMask, QString startGate);
signals:

};

#endif // SCREENCONTROLLER_H
