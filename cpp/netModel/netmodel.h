#ifndef NETMODEL_H
#define NETMODEL_H

#include <QObject>
#include <QWidget>
#include "debugnetsystem.h"
#include "interfacecredential.h"
#include "cpp/utilities/mylogger.h"
#include <QMap>
class NetModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(int declaredLength READ declaredLength NOTIFY declaredLengthChanged)
    Q_PROPERTY(QStringList declaredInterfaces READ declaredInterfaces NOTIFY declaredInterfacesChanged)
    QMap<QString,InterfaceCredential> m_credentials;
    Q_PROPERTY(QString currentSelectedInterface READ getCurrentSelectedInterface NOTIFY currentSelectedInterfaceChanged)
    INetSystem * m_system;
private:
    QString currentSelectedInterface;
public:
    explicit NetModel(INetSystem* sys, QObject *parent = nullptr);
    int declaredLength();
public slots:
    void refresh();
    QVariant fromName(QString name);
    void setInterface(QString, QString, QString, QString, bool );
    QStringList declaredInterfaces();
    QString getCurrentSelectedInterface();
    void setCurrentSelectedInterface(QString);
signals:
    void declaredInterfacesChanged();
    void declaredLengthChanged(int);
    void currentSelectedInterfaceChanged(QString);

};

#endif // NETMODEL_H
