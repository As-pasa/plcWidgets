#include "messagedisplayer.h"

MessageDisplayer::MessageDisplayer(QObject *parent) : QObject(parent)
{

}

void MessageDisplayer::showMessage(QString message)
{
    currentMessage=message;

    emit messageChanged(message);

}

QString MessageDisplayer::getMessage()
{
    return currentMessage;
}
