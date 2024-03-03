#ifndef TIMEMODEL_H
#define TIMEMODEL_H

#include "itimesystem.h"
#include "debugtimesystem.h"
#include "timechangepackage.h"
#include <QObject>
#include <QDateTime>
#include <QTimer>
#include <QDebug>
#include <QtMath>
#include <QTimeZone>
#include "cpp/utilities/mylogger.h"
class TimeModel:public QObject

{

    Q_PROPERTY(QDateTime currentTime READ currentTime NOTIFY currentTimeChanged)
    Q_PROPERTY(bool NIPStatus READ NIPStatus WRITE setNIPStatus NOTIFY NIPStatusChanged)
    Q_PROPERTY(bool ATZStatus READ ATZStatus WRITE setATZStatus NOTIFY ATZStatusChanged)
    Q_PROPERTY(QStringList timeZones READ timeZones  NOTIFY timeZonesChanged)
    Q_PROPERTY(QString currentTimeZone READ currentTimeZone WRITE setCurrentTimeZone NOTIFY currentTimeZoneChanged)
    Q_OBJECT
private:
    ITimeSystem* m_system;
    QTimer* m_timer;
    QDateTime m_currentDT;
    QStringList m_timeZones;
    QString m_currentTimeZone="";
    bool m_NipStatus;
    bool m_ATZStatus;

public:
    TimeModel(ITimeSystem* system);
    QStringList timeZones();
    QDateTime currentTime();
    bool NIPStatus();
    bool ATZStatus();





    void setCurrentTimeZone(QString);

signals:
    void currentTimeChanged(QDateTime n);
    void timeZonesChanged(QStringList);
    void NIPStatusChanged(bool status);
    void ATZStatusChanged(bool status);
    void currentTimeZoneChanged(QString);

public slots:
    QString currentTimeZone();
    void installCurrentTimeZoneAsSystem();
    void setCurrentTime(QDateTime);
    void setTimeZone(QString);
    void setNIPStatus(bool);


    void setATZStatus(bool status);
};

#endif // TIMEMODEL_H

