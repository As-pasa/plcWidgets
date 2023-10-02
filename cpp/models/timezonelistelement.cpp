#include "timezonelistelement.h"

TimeZoneListElement::TimeZoneListElement(QString a)
{
    m_name=a;
}

QString TimeZoneListElement::name()
{
    return m_name;
}
