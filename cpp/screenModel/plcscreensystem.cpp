#include "plcscreensystem.h"

plcScreenSystem::plcScreenSystem()
{

    QString ans;
    if(!os::readFromFile(m_maxBrightnessPath, ans)){
        MyLogger::err("sreenSystem","error while accessing max screen brightness config, path:" +m_maxBrightnessPath);
        maxBr=1;
    }else{
        maxBr=ans.chopped(1).toInt();

    }
    ans="";
    if(!os::readFromFile(m_configPath, ans)){
        MyLogger::err("screenSystem","error while accessing screen brightness config, path:"+m_configPath);
        curBr=maxBr;

    }else{
        curBr=ans.chopped(1).toInt();
    }
}



void plcScreenSystem::setScreenBrightness(int value)
{
    MyLogger::log("screenSystem","set brightness performed: value: "+QString::number(value));
    int foo= value*maxBr/100;
    os::writeToFile(m_configPath,QString::number(foo));
    os::writeToFile(m_fileSetterPath,QString::number(foo));
}

int plcScreenSystem::getCurrentScreenBrightness()
{
    qDebug()<<"brightness calculated"<<curBr<<" "<<maxBr;
    MyLogger::log("screenSystem","brightness calculated: (current, max)"+QString::number(curBr)+", "+QString::number(maxBr));
    return curBr*100/maxBr;
}

void plcScreenSystem::calibrate()
{
    MyLogger::log("screenSystem","calibration started");
    QProcess proc;
    proc.start("ts_calibrate");
    proc.waitForFinished(60000);
    MyLogger::log("screenSystem","calibration ended");
}
