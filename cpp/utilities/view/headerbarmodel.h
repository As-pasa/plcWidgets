#ifndef HEADERBARMODEL_H
#define HEADERBARMODEL_H

#include <QObject>
#include <QMap>
class HeaderBarModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString BarState READ getCurrentState NOTIFY BarStateChanged)
public:
    explicit HeaderBarModel(QObject *parent = nullptr);
    enum BarStates{
        Opened,
        Closed
    };
    Q_ENUM(BarStates)
    BarStates m_currentState;
    static const QMap<BarStates,QString> StateToName;
public slots:
    void setState(BarStates state);
    QString getCurrentState();
signals:
    void BarStateChanged(QString);

};

#endif // HEADERBARMODEL_H
