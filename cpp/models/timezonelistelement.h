#ifndef TIMEZONELISTELEMENT_H
#define TIMEZONELISTELEMENT_H

#include <QObject>

class TimeZoneListElement
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name NOTIFY nameChanged)
private:
    QString m_name;

public:
    TimeZoneListElement(QString);
    QString name();

signals:
    void nameChanged(QString);
};

#endif // TIMEZONELISTELEMENT_H
