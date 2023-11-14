#ifndef TIMECHANGEPACKAGE_H
#define TIMECHANGEPACKAGE_H

#include <QTime>
#include <QDate>
#include <QString>
class TimeChangePackage
{
public:
    TimeChangePackage(QTime ctime, QDate cdate, QString ctimeZone,bool cTimeChanged,bool cDateChanged,bool ctimeZoneChanged);
    QTime time;
    QDate date;
    QString timeZone;
    bool timeChanged, dateChanged, timeZoneChanged;
};

#endif // TIMECHANGEPACKAGE_H
