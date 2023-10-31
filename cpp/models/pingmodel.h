#ifndef PINGMODEL_H
#define PINGMODEL_H

#include <QObject>
#include <QWidget>
#include "../systems/debugpingsystem.h"
class PingModel : public QObject
{
    Q_OBJECT
public:
    explicit PingModel(DebugPingSystem* system, QObject *parent = nullptr);
private:
    QString lastPingResult;
    DebugPingSystem* m_system;
public slots:
    void startLocalPing(QString ip);
    void startWebPing(QString ip);
    QString getPingResult();


signals:
    void pingExecutionEnded();
};

#endif // PINGMODEL_H
