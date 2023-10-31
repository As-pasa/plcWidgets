#ifndef DEBUGPASSWORDMODEL_H
#define DEBUGPASSWORDMODEL_H

#include <QString>
#include <QDebug>
#include <QStringList>
class DebugPasswordSystem
{
public:
    DebugPasswordSystem();
    bool checkPassword(QString password);
    void setPassword(QString password);
    QStringList getContacts();
};

#endif // DEBUGPASSWORDMODEL_H
