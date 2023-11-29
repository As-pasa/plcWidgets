#ifndef DEVINFOMODEL_H
#define DEVINFOMODEL_H

#include <QObject>
#include <QString>
#include <QDebug>
#include <QQmlApplicationEngine>
#include <QTranslator>
#include <QCoreApplication>
#include <QDebug>
#include <QGuiApplication>
#include "plcdevicesystem.h"
class DevInfoModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString deviceName READ deviceName NOTIFY deviceNameChanged)
    Q_PROPERTY(QString deviceType READ deviceType NOTIFY deviceTypeChanged)
    Q_PROPERTY(QString firmWare READ firmWare NOTIFY firmWareChanged)
    Q_PROPERTY(QString firmWareDate READ firmWareDate NOTIFY firmWareDateChanged)
    Q_PROPERTY(QString firmwareVersion READ getFirmwareVersion NOTIFY firmwareVersionChanged)
private:
    QQmlApplicationEngine* m_root;
    QTranslator m_translator;
    QStringList languages;
    int curInd;
    PlcDeviceSystem * m_system;
public:
    explicit DevInfoModel(QQmlApplicationEngine* root, PlcDeviceSystem* system, QObject *parent = nullptr);
    QString deviceName();
    QString deviceType();
    QString firmWare();
    QString firmWareDate();
    QString getFirmwareVersion();

public slots:

    void retranslate();
    void close();

signals:
    void deviceNameChanged(QString);
    void deviceTypeChanged(QString);
    void firmWareDateChanged(QString);
    void firmWareChanged(QString);
    void firmwareVersionChanged(QString);

};

#endif // DEVINFOMODEL_H
