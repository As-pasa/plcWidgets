#ifndef FILEMODEL_H
#define FILEMODEL_H

#include <QObject>
#include "cpp/systems/ifilesystem.h"
#include <QDebug>

class FileModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList innerFiles READ innerFiles NOTIFY innerFilesChanged)
    Q_PROPERTY(QStringList outerSaveDirs READ outerSaveDirs NOTIFY outerSaveDirsChanged)
    Q_PROPERTY(int innerFreeMB READ innerFreeMB NOTIFY innerFreeMBChanged)
    Q_PROPERTY(int innerUsedMB READ innerUsedMB NOTIFY innerUsedMBChanged)
    Q_PROPERTY(int outUsedMB READ outUsedMB NOTIFY outUsedMBChanged)
    Q_PROPERTY(int outFreeMB READ outFreeMB NOTIFY outFreeMBChanged)

public:
    explicit FileModel( IFileSystem *sys,QString innerFileDir, QString outRoot, QObject *parent = nullptr);

private:
    IFileSystem* m_system;
    QStringList m_innerFileListCache;
    QStringList m_outerDirListCache;
    QString m_innerFileDir;
    QString m_backupDirRoot;
public:

    QStringList innerFiles();
    QStringList outerSaveDirs();
    int innerFreeMB();
    int innerUsedMB();
    int outUsedMB();
    int outFreeMB();
public slots:
    void restoreFiles(QString outerDir);
    void backupFiles(QStringList filesToSave, QString saveName);
    void importFromFolder(QString folderName);
    void refreshInner();
    void refreshOuter();
    void removeFile(QStringList fileNameList);
    void formatInner();
signals:
    void innerFilesChanged(QStringList);
    void outerSaveDirsChanged(QStringList);
    void innerFreeMBChanged(int);
    void innerUsedMBChanged(int);
    void outUsedMBChanged(int);
    void outFreeMBChanged(int);

};

#endif // FILEMODEL_H
