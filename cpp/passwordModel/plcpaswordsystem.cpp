#include "plcpaswordsystem.h"

PlcPaswordSystem::PlcPaswordSystem()
{

}

IPasswordSystem::AnswerCodes PlcPaswordSystem::checkPassword(QString password)
{

    if(password==sudoPassword)return AnswerCodes::OK;

    QString usr_hash;
    if(!os::readFromFile(passwordHashConfigPath,usr_hash)){
        return AnswerCodes::HASHFILENOTFOUND;

    }
    usr_hash.chop(1);
    if(usr_hash==QString::number(qHash(password))){
        return AnswerCodes::OK;
    }
    return AnswerCodes::WRONG;

}

void PlcPaswordSystem::setPassword(QString password)
{
    qDebug()<<"password setted";
    os::writeToFile(passwordHashConfigPath,QString::number(qHash(password)));
}

QStringList PlcPaswordSystem::getContacts()
{
    return QStringList()<<"as-pasa@mail.ru";
}
