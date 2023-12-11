#ifndef MYLOGGER_H
#define MYLOGGER_H

#include <QObject>
#include <QString>
#include <QFile>
#include "os.h"
enum LogCode{
    debug=0,
    message=1,
    warning=2,
    error=3,
};

class LogEntity{
private:
    LogCode m_level;
    QString m_source;
    QString m_message;

public:
    LogEntity(LogCode level,
    QString source,
    QString message);
    QString toString();
};



class MyLogger
{
private:
    LogCode m_logLevel;
    QString m_savePath;
    QList<LogEntity> m_logs;
    void m_log(LogEntity e);
    MyLogger(QString savePath, LogCode logLevel);



public:
    static MyLogger* m_instance;
    static MyLogger* getInstance();
    static void log(QString source, QString msg);
    static void msg(QString source, QString msg);
    static void warn(QString source, QString msg);
    static void err(QString source, QString msg);
    ~MyLogger();
};





#endif // MYLOGGER_H
