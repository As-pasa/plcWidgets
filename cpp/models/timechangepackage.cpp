#include "timechangepackage.h"

TimeChangePackage::TimeChangePackage(QTime ctime, QDate cdate, QByteArray ctimeZone, bool cTimeChanged, bool cDateChanged, bool ctimeZoneChanged)
{
    time=ctime;
    date=cdate;
    timeZone=ctimeZone;
    timeChanged=cTimeChanged;
    dateChanged=cDateChanged;
    timeZoneChanged=ctimeZoneChanged;
}
