#ifndef PLCPASWORDSYSTEM_H
#define PLCPASWORDSYSTEM_H
#include "../utilities/os.h"
#include "ipasswordsystem.h"
#include <QHash>
#include <QDebug>
class PlcPaswordSystem:public IPasswordSystem
{
private:
    QString sudoPassword="54321";
    QString passwordHashConfigPath="B:/coding/matemp/password.txt";


public:
    PlcPaswordSystem();

    // IPasswordSystem interface
public:
    AnswerCodes checkPassword(QString password);
    void setPassword(QString password);
    QStringList getContacts();
};

#endif // PLCPASWORDSYSTEM_H
