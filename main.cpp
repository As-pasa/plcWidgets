#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cpp/screenModel/debugscreensystem.h"
#include "cpp/screenModel/screenmodel.h"
#include "cpp/screenModel/plcscreensystem.h"
#include "cpp/wifiModel/plcwifisystem.h"
#include "cpp/wifiModel/wifimodel.h"
#include "cpp/netModel/netmodel.h"
#include "cpp/netModel/debugnetsystem.h"
#include "cpp/netModel/plcnetsystem.h"
#include "cpp/timeModel/plctimesystem.h"
#include "cpp/timeModel/timemodel.h"
#include "cpp/fileModel/plcfilesystem.h"
#include "cpp/fileModel/filemodel.h"
#include "cpp/pingModel/plcpingsystem.h"
#include "cpp/pingModel/pingmodel.h"
#include "cpp/passwordModel/plcpaswordsystem.h"
#include "cpp/passwordModel/debugpasswordsysteml.h"
#include "cpp/passwordModel/passwordmodel.h"
#include "cpp/devinfoModel/devinfomodel.h"
#include "cpp/devinfoModel/plcdevicesystem.h"
#include "cpp/utilities/messagedisplayer.h"
#include "cpp/utilities/confirmationDisplayer/commandconfirmator.h"
#include "cpp/utilities/mylogger.h"
#include "cpp/utilities/view/screenview.h"
#include "cpp/utilities/view/headerbarmodel.h"
#include "cpp/utilities/view/screencontroller.h"
#include "cpp/utilities/keyboard/keyboardbinder.h"
#include "cpp/utilities/keyboard/keyboardStateImpl.h"
#include "cpp/utilities/keyboard/keyboardconsumer.h"
#include "cpp/utilities/keyboard/debugkeyboardconsumer.h"
#include <QQmlContext>
#include <QDebug>
#include <QTranslator>
#include <QDir>
#include "cpp/utilities/keyboard/time/keybinderroles.h"
#include "cpp/utilities/keyboard/time/daykeyboardstate.h"
#include "cpp/utilities/keyboard/time/hourkeyboardstate.h"
#include "cpp/utilities/keyboard/time/minutekeyboardstate.h"
#include "cpp/utilities/keyboard/time/monthkeyboardstate.h"
#include "cpp/utilities/keyboard/time/yearkeyboardstate.h"
#include "cpp/utilities/keyboard/time/consumers/ITimeConsumer.h"

#include "cpp/utilities/keyboard/network/netinterfaceinputstate.h"
#include "cpp/utilities/keyboard/network/ipkeyboardstate.h"
#include "cpp/utilities/keyboard/network/ipconsumers.h"

#include "cpp/utilities/keyboard/password/gatewaypasswordconsumer.h"
#include "cpp/utilities/keyboard/password/passwordstate.h"
#include <QDateTime>
#include <QRegularExpression>
int main(int argc, char *argv[])
{



    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));




    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    CommandConfirmator* confirmator = new CommandConfirmator();
    MessageDisplayer*displayer = new  MessageDisplayer();
    PlcNetSystem* nets=new PlcNetSystem();
    PLCTimeSystem* s=new PLCTimeSystem();
    plcScreenSystem* screenSys=new plcScreenSystem();
    PlcFileSystem* fileSys=new PlcFileSystem();
    ScreenModel screenModel(screenSys,confirmator);

    FileModel fileModel(displayer,confirmator, fileSys,QString("/opt/codesys/"));
    PLCWifiSystem* wifiSystem=new PLCWifiSystem();
    plcPingSystem* pingSystem = new plcPingSystem();
    IPasswordSystem* passwordSystem = new PlcPaswordSystem();
    PlcDeviceSystem* devSystem=new PlcDeviceSystem();
    WifiModel wifiModel(wifiSystem);
    TimeModel model(s);
    NetModel netModel(nets);
    NetInterfaceInputState* interfaceInputState=new NetInterfaceInputState(&netModel);
    DevInfoModel devInfo(&engine,devSystem);
    PingModel pingModel(displayer, pingSystem);
    PasswordModel passwordModel(passwordSystem);
    HeaderBarModel header;
    ScreenView screens;
    ScreenController screenController(&header,&screens,&passwordModel,displayer,interfaceInputState);
    KeyboardBinder keyboardBinder(&screenController);
    keyboardBinder.addState(KeyBinderRoles::TimeRoles::Day,new DayKeyboardState(&model));
    keyboardBinder.addConsumer(KeyBinderRoles::TimeRoles::Day,new DayConsumer(&screenController, &model));

    keyboardBinder.addState(KeyBinderRoles::TimeRoles::Month,new MonthKeyboardState(&model));
    keyboardBinder.addConsumer(KeyBinderRoles::TimeRoles::Month,new MonthConsumer(&screenController,&model));

    keyboardBinder.addState(KeyBinderRoles::TimeRoles::Year,new YearKeyboardState(&model));
    keyboardBinder.addConsumer(KeyBinderRoles::TimeRoles::Year,new YearConsumer(&screenController,&model));

    keyboardBinder.addState(KeyBinderRoles::TimeRoles::Minute,new MinuteKeyboardState());
    keyboardBinder.addConsumer(KeyBinderRoles::TimeRoles::Minute,new MinuteConsumer(&screenController,&model));

    keyboardBinder.addState(KeyBinderRoles::TimeRoles::Hour,new HourKeyboardState());
    keyboardBinder.addConsumer(KeyBinderRoles::TimeRoles::Hour,new HourConsumer(&screenController,&model));

    keyboardBinder.addState(KeyBinderRoles::InterfaceRoles::Ip,new IpKeyboardState());
    keyboardBinder.addState(KeyBinderRoles::InterfaceRoles::Mask,new IpKeyboardState());
    keyboardBinder.addState(KeyBinderRoles::InterfaceRoles::Gate,new IpKeyboardState());

    keyboardBinder.addConsumer(KeyBinderRoles::InterfaceRoles::Ip,new IpConsumer(&screenController,interfaceInputState));
    keyboardBinder.addConsumer(KeyBinderRoles::InterfaceRoles::Mask,new MaskConsumer(&screenController,interfaceInputState));
    keyboardBinder.addConsumer(KeyBinderRoles::InterfaceRoles::Gate,new GateConsumer(&screenController,interfaceInputState));

    keyboardBinder.addState(KeyBinderRoles::PasswordRoles::Password,new PasswordState(&passwordModel));

    keyboardBinder.addConsumer(KeyBinderRoles::PasswordRoles::Password,new GatewayPasswordConsumer(&screenController));


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    qmlRegisterType<ScreenView>("ScreenService",1,0,"Screens");
    qmlRegisterType<HeaderBarModel>("HeaderService",1,0,"Header");
    qmlRegisterType<KeyBinderRoles>("KeyboardService",1,0,"KeyRole");
    QQmlContext* root=engine.rootContext();
    root->setContextProperty("timeModel",&model);
    root->setContextProperty("devInfo",&devInfo);
    root->setContextProperty("screenModel",&screenModel);
    root->setContextProperty("fileModel",&fileModel);
    root->setContextProperty("wifiModel",&wifiModel);
    root->setContextProperty("pingModel",&pingModel);
    root->setContextProperty("passwordModel",&passwordModel);
    root->setContextProperty("netModel",&netModel);
    root->setContextProperty("messager",displayer);
    root->setContextProperty("confirmator",confirmator);
    root->setContextProperty("screenView",&screens);
    root->setContextProperty("barModel",&header);
    root->setContextProperty("screenController",&screenController);
    root->setContextProperty("keyBinder",&keyboardBinder);
    root-> setContextProperty("interfaceInput",interfaceInputState);
    engine.load(url);
    screenController.goToScreen(ScreenView::TopMenu);
    return app.exec();
}
