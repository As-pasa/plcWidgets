#include "debugpingsystem.h"

DebugPingSystem::DebugPingSystem()
{

}

QString DebugPingSystem::getLocalPingResult(QString ip)
{
    return "everything is OK with local ip"+ip+"\n package 1 passed \n package 2 passed \n package 3 passed";
}

QString DebugPingSystem::getWebPingResult(QString ip)
{
    return "everything is OK with web ip"+ip+"\n package 1 passed \n package 2 passed \n package 3 passed";
}
