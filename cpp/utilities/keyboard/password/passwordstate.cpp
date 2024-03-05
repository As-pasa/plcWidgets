#include "passwordstate.h"


PasswordState::PasswordState(PasswordModel *model)
{
    m_model=model;
}

bool PasswordState::validate(QString nstring)
{
    return m_model->checkPassword(nstring);
}
