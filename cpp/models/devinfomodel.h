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

class DevInfoModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString deviceName READ deviceName NOTIFY deviceNameChanged)
    Q_PROPERTY(QString deviceType READ deviceType NOTIFY deviceTypeChanged)
    Q_PROPERTY(QString firmWare READ firmWare NOTIFY firmWareChanged)
    Q_PROPERTY(QString firmWareDate READ firmWareDate NOTIFY firmWareDateChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
private:
    QString m_password;
    QQmlApplicationEngine* m_root;
    QTranslator m_translator;
    QStringList languages;
    int curInd;
public:
    explicit DevInfoModel(QQmlApplicationEngine* root, QObject *parent = nullptr);
    QString deviceName();
    QString deviceType();
    QString firmWare();
    QString firmWareDate();
    QString password();

public slots:
    void setPassword(QString mpass);
    void retranslate();
    void close();

signals:
    void passwordChanged(QString);
    void deviceNameChanged(QString);
    void deviceTypeChanged(QString);
    void firmWareDateChanged(QString);
    void firmWareChanged(QString);
};

#endif // DEVINFOMODEL_H
