#include "plcscreensystem.h"

plcScreenSystem::plcScreenSystem()
{

    QString ans;
    if(!os::readFromFile(m_maxBrightnessPath, ans)){
        qDebug()<<"error while accessing max screen brightness config, path:" +m_maxBrightnessPath;
        maxBr=1;
    }else{
        maxBr=ans.chopped(1).toInt();

    }
    ans="";
    if(!os::readFromFile(m_configPath, ans)){
        qDebug()<<"error while accessing screen brightness config, path:"+m_configPath;
        curBr=maxBr;

    }else{
        curBr=ans.chopped(1).toInt();
    }
}



void plcScreenSystem::setScreenBrightness(int value)
{

    int foo= value*maxBr/100;
    os::writeToFile(m_configPath,QString::number(foo));
}

int plcScreenSystem::getCurrentScreenBrightness()
{
    qDebug()<<"brightness calculated"<<curBr<<" "<<maxBr;
    return curBr*100/maxBr;
}

void plcScreenSystem::calibrate()
{
    QProcess proc;
    proc.start("ts_calibrate");
    proc.waitForFinished(60000);

}
