#include "mylogger.h"

void MyLogger::m_log(LogEntity e)
{
    m_logs.append(e);
    os::appendToFile(m_savePath,e.toString()+"\n");
}

MyLogger::MyLogger(QString savePath, LogCode logLevel)
{
    m_logLevel=logLevel;
    m_savePath=savePath;
    os::writeToFile(m_savePath,"");
}

MyLogger *MyLogger::getInstance()
{
    if(m_instance==nullptr){
        m_instance=new MyLogger("/home/info",LogCode::debug);
    }
    return m_instance;
}
MyLogger* MyLogger::m_instance = new MyLogger("B:/coding/info.txt",LogCode::debug);
void MyLogger::log(QString source, QString msg)
{
    getInstance()->m_log(LogEntity(LogCode::debug, source, msg));
}


void MyLogger::msg(QString source, QString msg)
{
    getInstance()->m_log(LogEntity(LogCode::message, source, msg));
}

void MyLogger::warn(QString source, QString msg)
{
    getInstance()->m_log(LogEntity(LogCode::warning, source, msg));
}

void MyLogger::err(QString source, QString msg)
{
    getInstance()->m_log(LogEntity(LogCode::error, source, msg));
}

MyLogger::~MyLogger()
{
    QString a;
    foreach (auto data, m_logs) {
        a+=data.toString();
    }
    os::writeToFile(m_savePath,a);

}

LogEntity::LogEntity(LogCode level, QString source, QString message)
{
    m_level=level;
    m_source=source;
    m_message=message;
}

QString LogEntity::toString()
{
    QString a;
    switch(m_level){
        case LogCode::debug:
            a="DEBUG";
        break;
    case LogCode::message:
        a="INFO";
        break;
    case LogCode::warning:
        a="WARN";
        break;
    case LogCode::error:
        a="ERROR";
        break;


    }

    return QString("%1 (%2): %3").arg(a,m_source,m_message);
}
