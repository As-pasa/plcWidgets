#ifndef PASSWORDMODEL_H
#define PASSWORDMODEL_H

#include <QObject>
#include "../systems/debugpasswordsysteml.h"

class PasswordModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList contacts READ contacts NOTIFY contactsChanged)

public:
    explicit PasswordModel(DebugPasswordSystem* system, QObject *parent = nullptr);

private:
    DebugPasswordSystem* m_system;

public slots:
    QStringList contacts();
    bool checkPassword(QString password);
    void setPassword(QString password);
signals:
    void contactsChanged(QStringList contacts);
};

#endif // PASSWORDMODEL_H
