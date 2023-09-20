#ifndef TIMECHANGEPACKAGE_H
#define TIMECHANGEPACKAGE_H

#include <QTime>
#include <QDate>
#include <QByteArray>
class TimeChangePackage
{
public:
    TimeChangePackage(QTime ctime, QDate cdate, QByteArray ctimeZone,bool cTimeChanged,bool cDateChanged,bool ctimeZoneChanged);
    QTime time;
    QDate date;
    QByteArray timeZone;
    bool timeChanged, dateChanged, timeZoneChanged;
};

#endif // TIMECHANGEPACKAGE_H
