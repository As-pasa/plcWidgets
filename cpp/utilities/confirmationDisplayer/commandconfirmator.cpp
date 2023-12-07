#include "commandconfirmator.h"




void CommandConfirmator::requestConfirm(Confirmable*c)
{
    isIdle=false;
    m_current=c;
    emit confirmRequested(m_current->getDescription());
}

CommandConfirmator::CommandConfirmator(QObject *parent)
{
    isIdle=true;

}

void CommandConfirmator::enqueue(Confirmable *c)
{
    if(isIdle){
        requestConfirm(c);
    }
    else{
        m_requests.append(c);
    }
}

void CommandConfirmator::accept()
{
    m_current->accept();
    delete m_current;
    if(m_requests.isEmpty()){
        isIdle=true;
    }
    else{
        requestConfirm(m_requests.takeFirst());
    }
}
