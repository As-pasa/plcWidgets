#include "debugpasswordsysteml.h"

DebugPasswordSystem::DebugPasswordSystem()
{

}

IPasswordSystem::AnswerCodes DebugPasswordSystem::checkPassword(QString password)
{
    if(password=="54321"){
        return IPasswordSystem::AnswerCodes::OK;

    }
    return IPasswordSystem::AnswerCodes::WRONG;
}

void DebugPasswordSystem::setPassword(QString password)
{
    qDebug()<<"password changed to "<<password;
}

QStringList DebugPasswordSystem::getContacts()
{
  return QStringList() << "NoSuchAddress@fake.com"<< "NoSuchAddress1@fake.com"<< "NoSuchAddress2@fake.com";
}
