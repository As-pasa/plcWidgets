#include "debugkeyboardconsumer.h"

DebugKeyboardConsumer::DebugKeyboardConsumer()
{

}

void DebugKeyboardConsumer::consume(QString st)
{
    qDebug()<<st;
}
