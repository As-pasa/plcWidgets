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
#include <QQmlContext>
#include <QDebug>
#include <QTranslator>
#include <QDir>
int main(int argc, char *argv[])
{

    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));


    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    MyLogger::log("main","hello world");
    QApplication app(argc, argv);
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
    DevInfoModel devInfo(&engine,devSystem);
    PingModel pingModel(displayer, pingSystem);
    PasswordModel passwordModel(passwordSystem);




    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);


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
    engine.load(url);



    return app.exec();
}
