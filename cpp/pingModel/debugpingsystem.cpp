#include "debugpingsystem.h"

DebugPingSystem::DebugPingSystem()
{

}

QString DebugPingSystem::getPingResult(QString ip)
{
    return "everything is OK with local ip"+ip+"\n package 1 passed \n package 2 passed \n package 3 passed";
}


