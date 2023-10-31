#include "devinfomodel.h"

DevInfoModel::DevInfoModel(QQmlApplicationEngine* root,QObject *parent) : QObject(parent)
{
    m_password="555";
    m_root=root;
    languages<<":/baseWidgets_en.qm";
    languages<<":/baseWidgets_ru.qm";

    curInd = 0;
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

void DevInfoModel::retranslate()
{
    if (!m_translator.isEmpty()){
        {QCoreApplication::removeTranslator(&m_translator);};
    }
    curInd+=1;
    m_translator.load(languages[( curInd)%2]);

    QCoreApplication::instance()->installTranslator(&m_translator);


    m_root->retranslate();

    qDebug()<<"retranslate";
}

void DevInfoModel::close()
{
    QCoreApplication::quit();
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
