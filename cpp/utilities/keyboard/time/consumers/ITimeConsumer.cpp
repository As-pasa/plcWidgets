#include "ITimeConsumer.h".h"

MinuteConsumer::MinuteConsumer(TimeModel *m_model)
{
    model=m_model;
}

void MinuteConsumer::consume(QString st)
{
    bool isNum;
    int a = st.toInt(&isNum);
    if(isNum){
        QDateTime cur=model->currentTime();
        int hour=cur.time.hour();
        QTime tme= QTime(cur.time.hour(),a,cur.time().second());

        if(tme.isValid()){
            model->setCurrentTime(QDateTime(cur.date(),tme));
        }
    }
}

HourConsumer::HourConsumer(TimeModel *model)
{
    m_model=model;
}

void HourConsumer::consume(QString st)
{
    bool isNum;
    int a = st.toInt(&isNum);
    if(isNum){
        QDateTime cur=model->currentTime();

        QTime tme= QTime(a,cur.time.minute(),cur.time().second());
        if(tme.isValid()){
            model->setCurrentTime(QDateTime(cur.date(),tme));
        }
    }
}

DayConsumer::DayConsumer(TimeModel *model)
{
    m_model=model;
}

void DayConsumer::consume(QString st)
{

}

MonthConsumer::MonthConsumer(TimeModel *model)
{
    m_model=model;
}

void MonthConsumer::consume(QString st)
{

    bool isNum;
    int a = st.toInt(&isNum);
    if(isNum){
        QDateTime cur=model->currentTime();

        QDate dte = QDate(cur.date.year(),a,cur.date.day());
        if(dte.isValid()){
            model->setCurrentTime(QDateTime(dte,cur.time));
        }
    }
}

YearConsumer::YearConsumer(TimeModel *model)
{
    m_model=model;
}

void YearConsumer::consume(QString st)
{


    bool isNum;
    int a = st.toInt(&isNum);
    if(isNum){
        QDateTime cur=model->currentTime();

        QDate dte = QDate(a,cur.date.month(),cur.date.day());
        if(dte.isValid()){
            model->setCurrentTime(QDateTime(dte,cur.time));
        }
    }
}
