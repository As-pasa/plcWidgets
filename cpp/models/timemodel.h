#ifndef TIMEMODEL_H
#define TIMEMODEL_H

#include "../systems/itimesystem.h"
#include "../systems/debugtimesystem.h"
#include <QObject>
#include <QDateTime>
#include <QTimer>
#include <QDebug>
#include <QtMath>
class TimeModel:public QObject

{

    Q_PROPERTY(QDateTime currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(bool NIPStatus READ NIPStatus WRITE setNIPStatus NOTIFY NIPStatusChanged)
    Q_PROPERTY(bool ATZStatus READ ATZStatus WRITE setATZStatus NOTIFY ATZStatusChanged)

    Q_OBJECT
private:
    DebugTimeSystem* m_system;
    QTimer* m_timer;
    QDateTime current;

public:
    TimeModel(DebugTimeSystem* system);

    QDateTime currentTime();
    void setCurrentTime(QDateTime);

    bool NIPStatus();
    void setNIPStatus(bool);

    bool ATZStatus();
    void setATZStatus(bool status);

signals:
    void currentTimeChanged(QDateTime n);
    void NIPStatusChanged(bool status);
    void ATZStatusChanged(bool status);
};

#endif // TIMEMODEL_H

