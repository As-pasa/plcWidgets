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
    explicit PingModel(MessageDisplayer* displayer, IPingSystem* system, QObject *parent = nullptr);
private:
    QString lastPingResult;
    IPingSystem* m_system;
    MessageDisplayer* m_displayer;
public slots:
    void startPing(QString ip);
    QString getPingResult();


signals:
    void pingExecutionEnded();
};

#endif // PINGMODEL_H
