#ifndef MESSAGEDISPLAYER_H
#define MESSAGEDISPLAYER_H

#include <QObject>

class MessageDisplayer : public QObject
{
    Q_OBJECT
public:
    explicit MessageDisplayer(QObject *parent = nullptr);
    void showMessage(QString message);
signals:
    void messageFound(QString);
};

#endif // MESSAGEDISPLAYER_H
