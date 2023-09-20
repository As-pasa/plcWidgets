#ifndef OS_H
#define OS_H

#include <QString>
#include <QProcess>
namespace os{
bool System(const QString cmd, bool elevation = false, QString* pOutput = NULL);
bool System2(const QString cmd, const QStringList args, bool elevation = false, QString* pOutput = NULL);
}
#endif // OS_H
