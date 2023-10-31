#include "debugpasswordsysteml.h"

DebugPasswordSystem::DebugPasswordSystem()
{

}

bool DebugPasswordSystem::checkPassword(QString password)
{
    return password=="54321";
}

void DebugPasswordSystem::setPassword(QString password)
{
    qDebug()<<"password changed to "<<password;
}

QStringList DebugPasswordSystem::getContacts()
{
  return QStringList() << "NoSuchAddress@fake.com"<< "NoSuchAddress1@fake.com"<< "NoSuchAddress2@fake.com";
}
