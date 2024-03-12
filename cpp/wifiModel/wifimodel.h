#ifndef WIFIMODEL_H
#define WIFIMODEL_H

#include <QObject>
#include <QVariant>
#include "iwifisystem.h"
#include "cpp/utilities/mylogger.h"
class WifiModel:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int declaredLength READ declaredLength NOTIFY declaredLengthChanged)
    Q_PROPERTY(QStringList declaredNetworks READ getDeclaredNetworks NOTIFY declaredNetworksChanged)
private:

    IWifiSystem* m_system;
    QString selectedNetworkName;
public:

    WifiModel(IWifiSystem* wifiSystem);
    int declaredLength();
    QString getSelectedNetworkName();
public slots:
    void setSelectedNetworkName(QString);
    void tryConnect(int idx, QString password);
    void tryConnect(QString name,QString password);
    void refresh();
    QVariant fromId(int id);
    QStringList getDeclaredNetworks();
signals:
    void declaredLengthChanged(int);
    void declaredNetworksChanged(QStringList);
};

#endif // WIFIMODEL_H
