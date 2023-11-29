#ifndef INTERFACECREDENTIAL_H
#define INTERFACECREDENTIAL_H

#include <QObject>
#include <QString>
struct InterfaceCredential
{
private:
    Q_GADGET
    Q_PROPERTY(QString name MEMBER name)
    Q_PROPERTY(QString ip MEMBER ip)
    Q_PROPERTY(QString mask MEMBER mask)
    Q_PROPERTY(QString gate MEMBER gate)
    Q_PROPERTY(bool dhcp MEMBER DHCPUsed)


public:
    QString name;
    QString ip;
    QString mask;
    QString gate;
    bool DHCPUsed;
    QString toString();

    static InterfaceCredential from(QString c_name, QString c_ip, QString c_mask, QString c_gate, bool DHCP);

};
Q_DECLARE_METATYPE(InterfaceCredential)
#endif // INTERFACECREDENTIAL_H
