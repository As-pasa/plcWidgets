#ifndef COMMANDCONFIRMATOR_H
#define COMMANDCONFIRMATOR_H

#include <QObject>
#include <QString>
#include <QQueue>
#include <QDebug>
class Confirmable{
  public:
    virtual QString getDescription()=0;
    virtual void accept()=0;
};

class CommandConfirmator:public QObject
{
    Q_OBJECT
private:
    Confirmable* m_current;
    bool isIdle;
    QQueue<Confirmable*> m_requests;
    void requestConfirm(Confirmable*c);
public:
    explicit CommandConfirmator(QObject* parent=nullptr);
    void enqueue(Confirmable* c);
public slots:
    void accept();
signals:
    void confirmRequested(QString);
};

#endif // COMMANDCONFIRMATOR_H
