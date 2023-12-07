#ifndef DEBUGPASSWORDMODEL_H
#define DEBUGPASSWORDMODEL_H

#include <QString>
#include <QDebug>
#include <QStringList>
#include "ipasswordsystem.h"
class DebugPasswordSystem:public IPasswordSystem
{
public:
    DebugPasswordSystem();
    IPasswordSystem::AnswerCodes checkPassword(QString password);
    void setPassword(QString password);
    QStringList getContacts();
};

#endif // DEBUGPASSWORDMODEL_H
