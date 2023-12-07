#ifndef IPASSWORDSYSTEM_H
#define IPASSWORDSYSTEM_H

#include <QObject>
class IPasswordSystem
{


public:
    enum AnswerCodes {OK=0, WRONG=1, HASHFILENOTFOUND=2};
    virtual AnswerCodes checkPassword(QString password)=0;
    virtual void setPassword(QString password)=0;
    virtual QStringList getContacts()=0;
};

#endif // IPASSWORDSYSTEM_H
