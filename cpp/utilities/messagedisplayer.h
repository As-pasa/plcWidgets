#ifndef MESSAGEDISPLAYER_H
#define MESSAGEDISPLAYER_H

#include <QObject>

class MessageDisplayer : public QObject
{
    Q_PROPERTY(QString message READ getMessage NOTIFY messageChanged)
    Q_OBJECT
public:
    explicit MessageDisplayer(QObject *parent = nullptr);
    QString currentMessage="";
    void showMessage(QString message);
public slots:
    QString getMessage();
signals:
    void messageChanged(QString);
};

#endif // MESSAGEDISPLAYER_H
