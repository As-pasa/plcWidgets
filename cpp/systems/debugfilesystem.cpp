#include "debugfilesystem.h"

DebugFileSystem::DebugFileSystem()
{
 answer<<"aaa"<<"bbb"<<"ccc"<<"ddd"<<"eee"<<"fff"<<"ggg"<<"hhh"<<"jjj"<<"kkk"<<"lll"<<"mmm"<<"nnn"<<"ooo"<<"ppp";
 answerOut<<"dir1"<<"dir2"<<"dir3";
}

void DebugFileSystem::copySelected(QString from, QString to, QStringList files)
{
   qDebug()<<"copied "<<files;
   qDebug()<<"from "<<from << "to "<<to;
}

void DebugFileSystem::copyAll(QString from, QString to)
{
    qDebug()<<"Copied all";
    qDebug()<<"from "<< from <<"to"<<to;

}

QStringList DebugFileSystem::fileList(QString dir, bool recursive)
{
    if(dir=="a"){
        qDebug()<<"file list requested";
        return answer;
    }
    if(dir=="b"){
        qDebug()<<"save dirs list requested";
        return answerOut;

    }

}

int DebugFileSystem::getInnerTotalMB()
{
    return 200;
}

int DebugFileSystem::getInnerUsedMB()
{
    return 50;
}

int DebugFileSystem::getOuterTotalMB(bool &isOuterMounted)
{
    isOuterMounted=true;
    return 800;
}

int DebugFileSystem::getOuterUsedMB(bool &isOuterMounted)
{
    isOuterMounted=true;
    return 300;
}

void DebugFileSystem::removeFile(QStringList fileNameList)
{
    qDebug()<<fileNameList;
    foreach (QString a, fileNameList) {
        answer.removeAll(a);
        qDebug()<<"file "<<a<<"deleted";
    }
    qDebug()<<answer;


}

void DebugFileSystem::formatInner()
{
    qDebug()<<"inner storage formatted";
    answer.clear();
}
