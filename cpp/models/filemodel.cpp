#include "filemodel.h"

FileModel::FileModel(IFileSystem *sys,QString innerFileDir, QString outRoot,  QObject *parent) : QObject(parent)
{
     m_system=sys;
     m_innerFileDir=innerFileDir;
     m_backupDirRoot=outRoot;
     refreshInner();
     refreshOuter();
}


QStringList FileModel::innerFiles()
{

    return m_innerFileListCache;
}

QStringList FileModel::outerSaveDirs()
{
    return m_outerDirListCache;
}

int FileModel::innerFreeMB()
{
    return m_system->getInnerTotalMB()-m_system->getInnerUsedMB();
}

int FileModel::innerUsedMB()
{
    return m_system->getInnerUsedMB();
}

int FileModel::outUsedMB()
{
    bool mounted=true;
        int x = m_system->getOuterUsedMB(mounted);
        if(mounted){
            return x;
        }
        else{
            return 0;
        }
}

int FileModel::outFreeMB()
{
    bool mounted=true;
        int x = m_system->getOuterUsedMB(mounted);
        int y = m_system->getOuterTotalMB(mounted);
        if(mounted){
            return y-x;
        }
        else{
            return 0;
        }
}
void FileModel::restoreFiles(QString outerDir)
{
    m_system->copyAll(outerDir,m_innerFileDir);
}

void FileModel::backupFiles(QStringList filesToSave, QString saveName)
{

    m_system->copySelected(m_innerFileDir,saveName,filesToSave);
}

void FileModel::importFromFolder(QString folderName)
{
    m_system->removeFile(m_innerFileListCache);
    m_system->copyAll(folderName,m_innerFileDir);
    refreshInner();
}

void FileModel::refreshInner()
{
    m_innerFileListCache= m_system->fileList(m_innerFileDir,true);
    emit innerFilesChanged(m_innerFileListCache);

}

void FileModel::refreshOuter()
{
    m_outerDirListCache= m_system->fileList(m_backupDirRoot,false);
    emit outerSaveDirsChanged(m_outerDirListCache);
}

void FileModel::removeFile(QStringList fileNameList)
{
    m_system->removeFile(fileNameList);
    refreshInner();
    emit innerFilesChanged(m_innerFileListCache);
}

void FileModel::formatInner()
{
    m_system->formatInner();
    refreshInner();
    emit innerFilesChanged(m_innerFileListCache);
}
