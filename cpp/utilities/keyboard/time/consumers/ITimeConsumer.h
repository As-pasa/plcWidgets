#ifndef MINUTECONSUMER_H
#define MINUTECONSUMER_H

#include "../../../../timeModel/timemodel.h"
#include "cpp/utilities/view/screencontroller.h"
#include "../../keyboardconsumer.h"
class MinuteConsumer:public KeyboardConsumer
{
public:

    private:
        TimeModel* model;
        ScreenController* m_controller;
        // KeyboardConsumer interface
    public:
        MinuteConsumer(ScreenController*m_controller, TimeModel* m_model);
        void consume(IKeyboardState* st);
};

class HourConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;
        ScreenController* m_controller;
        // KeyboardConsumer interface
    public:
        HourConsumer(ScreenController*controller,TimeModel*model);
        void consume(IKeyboardState* st);
};
class DayConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;
        ScreenController* m_controller;
        // KeyboardConsumer interface
    public:
        DayConsumer(ScreenController*controller,TimeModel*model);
        void consume(IKeyboardState* st);
};
class MonthConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;
        ScreenController* m_controller;
        // KeyboardConsumer interface
    public:
        MonthConsumer(ScreenController*controller,TimeModel*model);
        void consume(IKeyboardState* st);
};
class YearConsumer:public KeyboardConsumer{

    private:
        TimeModel*m_model;
        ScreenController* m_controller;
        // KeyboardConsumer interface
    public:
        YearConsumer(ScreenController*controller,TimeModel*model);
        void consume(IKeyboardState* st);
};


#endif // MINUTECONSUMER_H
