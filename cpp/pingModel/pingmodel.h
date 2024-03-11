#ifndef PINGMODEL_H
#define PINGMODEL_H

#include <QObject>
#include <QWidget>
#include "ipingsystem.h"
#include "../utilities/mylogger.h"
#include "../utilities/messagedisplayer.h"
class PingModel : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(QString selectedIp READ getSelectedIp NOTIFY selectedIpChanged)
    explicit PingModel(MessageDisplayer* displayer, IPingSystem* system, QObject *parent = nullptr);
private:
    QString lastPingResult;
    IPingSystem* m_system;
    MessageDisplayer* m_displayer;
    QString m_selectedIp="8.8.8.8";
public slots:
    QString ping(QString ip);
    QString getSelectedIp();
    void setSelectedIp(QString ip);

signals:
    void selectedIpChanged(QString);
};

#endif // PINGMODEL_H
