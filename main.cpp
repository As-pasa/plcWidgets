#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cpp/systems/debugtimesystem.h"
#include "cpp/systems/debugscreensystem.h"
#include "cpp/models/timemodel.h"
#include "cpp/models/devinfomodel.h"
#include "cpp/models/screenmodel.h"
#include <QQmlContext>
#include <QDebug>
int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    DebugTimeSystem* s=new DebugTimeSystem();
    DebugScreenSystem* screenSys=new DebugScreenSystem();
    ScreenModel screenModel(screenSys);

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
    engine.load(url);


    return app.exec();
}
