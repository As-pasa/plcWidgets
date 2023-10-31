#ifndef DEBUGPINGSYSTEM_H
#define DEBUGPINGSYSTEM_H

#include <QString>
class DebugPingSystem
{
public:
    DebugPingSystem();
    QString getLocalPingResult(QString ip);
    QString getWebPingResult(QString ip);

};

#endif // DEBUGPINGSYSTEM_H
