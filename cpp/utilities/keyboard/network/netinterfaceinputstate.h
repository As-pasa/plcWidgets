#ifndef NETINTERFACEINPUTSTATE_H
#define NETINTERFACEINPUTSTATE_H
#include <QObject>
#include <QString>
#include "../../../netModel/netmodel.h"

class NetInterfaceInputState:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString ip READ getIp NOTIFY ipChanged)
    Q_PROPERTY(QString mask READ getMask NOTIFY maskChanged)
    Q_PROPERTY(QString gate READ getGate NOTIFY gateChanged)
private:
    NetModel* m_model;
    QString m_ip;
    QString m_mask;
    QString m_gate;
    QString m_name;
public:
    void setName(QString str);
    void setIp(QString str);
    void setMask(QString str);
    void setGate(QString str);
    explicit NetInterfaceInputState(NetModel* model,QObject *parent=nullptr);

public slots:
    QString getIp();
    QString getMask();
    QString getGate();
        void accept();
signals:
    void ipChanged(QString);
    void maskChanged(QString);
    void gateChanged(QString);

};

#endif // NETINTERFACEINPUTSTATE_H
