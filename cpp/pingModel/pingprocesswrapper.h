#ifndef PINGPROCESSWRAPPER_H
#define PINGPROCESSWRAPPER_H

#include <QObject>
#include <QProcess>
#include <QDebug>
class PingProcessWrapper : public QObject
{
    Q_OBJECT
private:
    QString m_ip;
    QString output;

public:
    explicit PingProcessWrapper(QString ip, QObject* parent=nullptr);
    virtual ~PingProcessWrapper();
public slots:
    void process();
signals:
    void finished();
    void error(QString);
    void gotAnswer(QString);
};


#endif // PINGPROCESSWRAPPER_H
