#include "ITimeConsumer.h"

MinuteConsumer::MinuteConsumer(ScreenController* controller,TimeModel *m_model)
{
    model=m_model;
    m_controller=controller;
}

void MinuteConsumer::consume(IKeyboardState* st)
{

    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }
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

HourConsumer::HourConsumer(ScreenController* controller,TimeModel *model)
{
    m_model=model;
    m_controller=controller;
}

void HourConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }
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

DayConsumer::DayConsumer(ScreenController* controller,TimeModel *model)
{
    m_model=model;
    m_controller=controller;
}

void DayConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }

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

MonthConsumer::MonthConsumer(ScreenController* controller,TimeModel *model)
{
    m_model=model;
    m_controller=controller;
}

void MonthConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }

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

YearConsumer::YearConsumer(ScreenController* controller,TimeModel *model)
{
    m_model=model;
    m_controller=controller;
}

void YearConsumer::consume(IKeyboardState* st)
{
    if(!st->validate(st->getState())){

        m_controller->showInfoWithText("Wrong input value:\n"+ st->getState());
        return;
    }

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
