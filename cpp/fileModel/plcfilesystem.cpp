#include "plcfilesystem.h"

PlcFileSystem::PlcFileSystem()
{

}

void PlcFileSystem::copyAll(QString src, QString dst)
{
    QDir dir(src);
    if (! dir.exists())
        return;
    if(!QDir(dst).exists()){
        QDir d;
        d.mkpath(dst);
    }
    foreach (QString d, dir.entryList(QDir::Dirs | QDir::NoDotAndDotDot)) {
        QString dst_path = dst + QDir::separator() + d;
        dir.mkpath(dst_path);
        copyAll(src+ QDir::separator() + d, dst_path);
    }
    foreach (QString f, dir.entryList(QDir::Files)) {        
        QFile::copy(QDir::cleanPath(src + QDir::separator() + f), QDir::cleanPath(dst + QDir::separator() + f));
    }
}

bool PlcFileSystem::exists(QString path)
{

    return QFileInfo(path).exists();
}

QStringList PlcFileSystem::getFolderContent(QString folder)
{
    QStringList ans;
    auto x =QDir(folder);
    if(!x.exists()){
        return ans;
    }
    foreach (auto a, x.entryList()) {
        if(a!="." and a!="..")
        ans.append(a);
    }
    return ans;
}



