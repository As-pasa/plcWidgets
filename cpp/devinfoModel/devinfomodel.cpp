#include "devinfomodel.h"

DevInfoModel::DevInfoModel(PlcDeviceSystem *system, QObject *parent) : QObject(parent)
{
    m_system=system;

    languages<<":/baseWidgets_en.qm";
    languages<<":/baseWidgets_ru.qm";

    curInd = 0;
}





void DevInfoModel::retranslate()
{
    if (!m_translator.isEmpty()){
        {QCoreApplication::removeTranslator(&m_translator);};
    }
    curInd+=1;
    m_translator.load(languages[( curInd)%2]);







}

void DevInfoModel::close()
{
    QCoreApplication::quit();
}
QString DevInfoModel::deviceName()
{
    return m_system->getDeviceName();
}

QString DevInfoModel::deviceType()
{
    return m_system->getDeviceType();
}

QString DevInfoModel::firmWare()
{
    return m_system->getFirmware();
}

QString DevInfoModel::firmWareDate()
{
    return m_system->getFirmWareSettleTimeStamp();
}

QString DevInfoModel::getFirmwareVersion()
{
    return m_system->getFirmwareVersion();
}
