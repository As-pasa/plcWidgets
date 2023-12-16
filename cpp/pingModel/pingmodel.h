#ifndef PINGMODEL_H
#define PINGMODEL_H

#include <QObject>
#include <QWidget>
#include "ipingsystem.h"
#include "../utilities/mylogger.h"
class PingModel : public QObject
{
    Q_OBJECT
public:
    explicit PingModel(IPingSystem* system, QObject *parent = nullptr);
private:
    QString lastPingResult;
    IPingSystem* m_system;
public slots:
    void startPing(QString ip);
    QString getPingResult();


signals:
    void pingExecutionEnded();
};

#endif // PINGMODEL_H
