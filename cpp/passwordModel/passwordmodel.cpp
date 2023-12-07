#include "passwordmodel.h"

PasswordModel::PasswordModel(IPasswordSystem* system,QObject *parent) : QObject(parent)
{
    m_system=system;
}

QStringList PasswordModel::contacts()
{
    return m_system->getContacts();
}

void PasswordModel::checkPassword(QString password)
{
    IPasswordSystem::AnswerCodes a= m_system->checkPassword(password);
    if(a==IPasswordSystem::AnswerCodes::OK) emit passwordCorrect();
    else if(a==IPasswordSystem::AnswerCodes::WRONG) emit passwordWrong();
    else emit hashFileNotExist();
}

void PasswordModel::setPassword(QString password)
{
    qDebug()<<"set as password";
    return m_system->setPassword(password);
}

