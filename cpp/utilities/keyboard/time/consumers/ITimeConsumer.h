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
        void consume(IKeyboardState* st);
};

class HourConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        HourConsumer(TimeModel*model);
        void consume(IKeyboardState* st);
};
class DayConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        DayConsumer(TimeModel*model);
        void consume(IKeyboardState* st);
};
class MonthConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        MonthConsumer(TimeModel*model);
        void consume(IKeyboardState* st);
};
class YearConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;

        // KeyboardConsumer interface
    public:
        YearConsumer(TimeModel*model);
        void consume(IKeyboardState* st);
};


#endif // MINUTECONSUMER_H
