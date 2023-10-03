#include "devinfomodel.h"

DevInfoModel::DevInfoModel(QObject *parent) : QObject(parent)
{
    m_password="555";
}

QString DevInfoModel::password()
{
    return m_password;
}

void DevInfoModel::setPassword(QString mpass)
{
    m_password=mpass;
    emit passwordChanged(mpass);
}
QString DevInfoModel::deviceName()
{
    return "STABUR PLC 1";
}

QString DevInfoModel::deviceType()
{
    return "STABUR PLC 1";
}

QString DevInfoModel::firmWare()
{
    return "aaaa-bbbb-cccc";
}

QString DevInfoModel::firmWareDate()
{
    return "06.06.1905";
}
