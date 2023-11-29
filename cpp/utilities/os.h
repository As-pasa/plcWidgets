#ifndef OS_H
#define OS_H

#include <QString>
#include <QProcess>
#include <QFile>
#include <QDir>
#include <QFileInfo>
#include <QTextStream>
#include <QDebug>
namespace os{
bool System(const QString cmd, bool elevation = false, QString* pOutput = NULL);
bool System2(const QString cmd, const QStringList args, bool elevation = false, QString* pOutput = NULL);
bool writeToFile(QString path, QString string);
bool readFromFile(QString path, QString& output);
}
#endif // OS_H
