#ifndef TIMEMODEL_H
#define TIMEMODEL_H

#include "../systems/itimesystem.h"
#include <QObject>
class TimeModel:public QObject

{
    Q_OBJECT
public:
    TimeModel(ITimeSystem* system);
private:
    ITimeSystem* m_system;
    bool m_NipStatus;
    bool m_AtzStatus;
public:
    QDateTime getCurrentTime();
    bool getNipStatus();
    bool getAtzStatus();
    void setNipStatus(bool enabled);
    void setAtzStatus(bool enabled);

    void setTime(TimeChangePackage package);

signals:
    void NipStatusChanged(bool newStatus);
    void AtzStatusChanged(bool newStatus);
    void TimeChanged(QDateTime time);
};

#endif // TIMEMODEL_H
