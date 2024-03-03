#ifndef HEADERBARMODEL_H
#define HEADERBARMODEL_H

#include <QObject>
#include <QMap>
#include <QtDebug>
class HeaderBarModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString BarState READ getCurrentState NOTIFY BarStateChanged)
public:
    explicit HeaderBarModel(QObject *parent = nullptr);
    enum BarStates{
        Opened=1,
        Closed=2,
        Password=3
    };
    Q_ENUM(BarStates)
    int m_currentState;
    static const QMap<int,QString> StateToName;
public slots:
    void setState(int state);
    QString getStateName(int state);
    QString getCurrentState();
signals:
    void BarStateChanged(QString);

};

#endif // HEADERBARMODEL_H
