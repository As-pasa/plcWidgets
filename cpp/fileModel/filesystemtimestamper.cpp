#include "filesystemtimestamper.h"

FileSystemTimeStamper::FileSystemTimeStamper()
{

}

QString FileSystemTimeStamper::getStamp()
{
   return QDateTime::currentDateTime().toString("hh-mm-ss_dd_MM_yyyy");
}
