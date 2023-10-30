#include <QApplication>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cpp/systems/debugtimesystem.h"
#include "cpp/systems/debugscreensystem.h"
#include "cpp/models/timemodel.h"
#include "cpp/models/devinfomodel.h"
#include "cpp/models/screenmodel.h"
#include "cpp/models/filemodel.h"
#include "cpp/systems/debugfilesystem.h"
#include "cpp/systems/debugwifisystem.h"
#include "cpp/models/wifimodel.h"
#include <QQmlContext>
#include <QDebug>
int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);


    DebugTimeSystem* s=new DebugTimeSystem();
    DebugScreenSystem* screenSys=new DebugScreenSystem();
    DebugFileSystem* fileSys=new DebugFileSystem();
    ScreenModel screenModel(screenSys);
    FileModel fileModel(fileSys,"a","b");
    DebugWifiSystem* wifiSystem=new DebugWifiSystem();
    WifiModel wifiModel(wifiSystem);
    TimeModel model(s);
    DevInfoModel devInfo;

    QQmlApplicationEngine engine;
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
    engine.load(url);


    return app.exec();
}
