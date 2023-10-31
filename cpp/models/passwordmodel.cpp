#include "passwordmodel.h"

PasswordModel::PasswordModel(DebugPasswordSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
}

QStringList PasswordModel::contacts()
{
    return m_system->getContacts();
}

bool PasswordModel::checkPassword(QString password)
{
    return m_system->checkPassword(password);
}

void PasswordModel::setPassword(QString password)
{
    return m_system->setPassword(password);
}

