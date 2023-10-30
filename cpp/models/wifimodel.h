#ifndef WIFIMODEL_H
#define WIFIMODEL_H

#include <QObject>
#include <QVariant>
#include "../systems/iwifisystem.h"
class WifiModel:public QObject
{
    Q_OBJECT
    Q_PROPERTY(int declaredLength READ declaredLength NOTIFY declaredLengthChanged)

private:
    QList<WifiConnection> connections;
    IWifiSystem* m_system;

public:

    WifiModel(IWifiSystem* wifiSystem);
    int declaredLength();
public slots:
    void refresh();
    QVariant fromId(int id);
signals:
    void declaredLengthChanged(int);
};

#endif // WIFIMODEL_H
