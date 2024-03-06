#include "ITimeConsumer.h"

MinuteConsumer::MinuteConsumer(TimeModel *m_model)
{
    model=m_model;
}

void MinuteConsumer::consume(IKeyboardState* st)
{
    bool isNum;
    int a = st->getState().toInt(&isNum);
    if(isNum){
        QDateTime cur=model->currentTime();
        int hour,second;
        hour=cur.time().hour();
        second=cur.time().second();
        QTime tme= QTime(hour,a,second);

        if(tme.isValid()){
            auto aa=QDateTime(cur.date(),tme);
            model->setCurrentTime(aa);
            st->clearState();
        }
    }
}

HourConsumer::HourConsumer(TimeModel *model)
{
    m_model=model;
}

void HourConsumer::consume(IKeyboardState* st)
{
    bool isNum;
    int a = st->getState().toInt(&isNum);
    if(isNum){
        QDateTime cur=m_model->currentTime();

        QTime tme= QTime(a,cur.time().minute(),cur.time().second());
        if(tme.isValid()){
            m_model->setCurrentTime(QDateTime(cur.date(),tme));
            st->clearState();
        }
    }
}

DayConsumer::DayConsumer(TimeModel *model)
{
    m_model=model;
}

void DayConsumer::consume(IKeyboardState* st)
{
    bool isNum;
    int a = st->getState().toInt(&isNum);
    if(isNum){
        QDateTime cur = m_model->currentTime();

        QDate dte = QDate(cur.date().year(),cur.date().month(),a);
        if(dte.isValid()){
            m_model->setCurrentTime(QDateTime(dte,cur.time()));
            st->clearState();
        }
    }
}

MonthConsumer::MonthConsumer(TimeModel *model)
{
    m_model=model;
}

void MonthConsumer::consume(IKeyboardState* st)
{

    bool isNum;
    int a = st->getState().toInt(&isNum);
    if(isNum){
        QDateTime cur = m_model->currentTime();

        QDate dte = QDate(cur.date().year(),a,cur.date().day());
        if(dte.isValid()){
            m_model->setCurrentTime(QDateTime(dte,cur.time()));
            st->clearState();
        }
    }
}

YearConsumer::YearConsumer(TimeModel *model)
{
    m_model=model;
}

void YearConsumer::consume(IKeyboardState* st)
{


    bool isNum;
    int a = st->getState().toInt(&isNum);
    if(isNum){
        QDateTime cur=m_model->currentTime();

        QDate dte = QDate(a,cur.date().month(),cur.date().day());
        if(dte.isValid()){
            m_model->setCurrentTime(QDateTime(dte,cur.time()));
            st->clearState();
        }
    }
}
