#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "cpp/systems/debugtimesystem.h"
#include "cpp/models/timemodel.h"
#include <QQmlContext>
int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    DebugTimeSystem* s=new DebugTimeSystem();
    TimeModel model(s);


    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    QQmlContext* root=engine.rootContext();
    root->setContextProperty("timeModel",&model);
    return app.exec();
}
