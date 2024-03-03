#ifndef MINUTECONSUMER_H
#define MINUTECONSUMER_H

#include "../../../../timeModel/timemodel.h"
#include "../../keyboardconsumer.h"
class MinuteConsumer:public KeyboardConsumer
{
public:

    private:
        TimeModel* model;

        // KeyboardConsumer interface
    public:
        MinuteConsumer(TimeModel* m_model);
        void consume(QString st);
};

class HourConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        HourConsumer(TimeModel*model);
        void consume(QString st);
};
class DayConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        DayConsumer(TimeModel*model);
        void consume(QString st);
};
class MonthConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        MonthConsumer(TimeModel*model);
        void consume(QString st);
};
class YearConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        YearConsumer(TimeModel*model);
        void consume(QString st);
};


#endif // MINUTECONSUMER_H
