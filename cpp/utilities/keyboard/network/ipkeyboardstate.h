#ifndef IPKEYBOARDSTATE_H
#define IPKEYBOARDSTATE_H

#include "../ikeyboardstate.h"
#include <QRegularExpression>
class IpKeyboardState:public IKeyboardState
{
public:
    IpKeyboardState();

    // IKeyboardState interface
private:
    QRegularExpression m_regex;
    bool validate(QString nstring);
};

#endif // IPKEYBOARDSTATE_H
