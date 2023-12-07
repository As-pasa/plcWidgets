#ifndef NETMODEL_H
#define NETMODEL_H

#include <QObject>
#include <QWidget>
#include "debugnetsystem.h"
#include "interfacecredential.h"

class NetModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int declaredLength READ declaredLength NOTIFY declaredLengthChanged)
    QList<InterfaceCredential> m_credentials;
    INetSystem * m_system;
public:
    explicit NetModel(INetSystem* sys, QObject *parent = nullptr);
    int declaredLength();
public slots:
    void refresh();
    QVariant fromId(int);
    void setInterface(QString, QString, QString, QString, bool );
signals:
    void declaredLengthChanged(int);
};

#endif // NETMODEL_H
