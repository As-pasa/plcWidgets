#ifndef FILESYSTEMTIMESTAMPER_H
#define FILESYSTEMTIMESTAMPER_H

#include <QObject>
#include <QDateTime>
class FileSystemTimeStamper
{
public:
    FileSystemTimeStamper();
    QString getStamp();
};

#endif // FILESYSTEMTIMESTAMPER_H
