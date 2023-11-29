#include "savedeviceentry.h"



SaveDeviceEntry::SaveDeviceEntry(QString name, QString path, IFileSystem* system)
{
        m_system=system;
        m_name=name;
        m_path=path;
}

QString SaveDeviceEntry::getName()
{
    return m_name;
}

QString SaveDeviceEntry::getPath()
{
    return m_path;
}

QStringList SaveDeviceEntry::getEntries()
{
    return m_system->getFolderContent(m_path);
}

bool SaveDeviceEntry::isOnline()
{
    return m_system->exists(m_path);
}
