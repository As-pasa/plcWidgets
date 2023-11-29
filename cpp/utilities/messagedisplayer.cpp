#include "messagedisplayer.h"

MessageDisplayer::MessageDisplayer(QObject *parent) : QObject(parent)
{

}

void MessageDisplayer::showMessage(QString message)
{
    emit messageFound(message);
}
