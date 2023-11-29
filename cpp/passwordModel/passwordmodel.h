#ifndef PASSWORDMODEL_H
#define PASSWORDMODEL_H

#include <QObject>
#include "debugpasswordsysteml.h"

class PasswordModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList contacts READ contacts NOTIFY contactsChanged)

public:
    explicit PasswordModel(IPasswordSystem* system, QObject *parent = nullptr);

private:
    IPasswordSystem* m_system;

public slots:
    QStringList contacts();
    void checkPassword(QString password);
    void setPassword(QString password);
signals:
    void contactsChanged(QStringList contacts);
    void passwordCorrect();
    void passwordWrong();
    void hashFileNotExist();
};

#endif // PASSWORDMODEL_H
