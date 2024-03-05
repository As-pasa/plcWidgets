#include "ipkeyboardstate.h"

IpKeyboardState::IpKeyboardState()
{

    m_regex.setPattern("^((25[0-5]|(2[0-4]|1\\d|[1-9]|)\\d)\\.?\\b){4}$");
}

bool IpKeyboardState::validate(QString nstring)
{
    return m_regex.match(nstring).hasMatch();
}
