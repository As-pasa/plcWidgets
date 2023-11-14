#include "debugwifisystem.h"

DebugWifiSystem::DebugWifiSystem()
{
     cons <<WifiConnection::from("Noosphere","666","42.42.42.42","NONE","signal1");
     cons <<WifiConnection::from("n1","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n2","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n3","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n5","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("aaaaaaaaaaaaaaaaaaaaaaaaaaa","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("FRODOFRODOFRODOFRO","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n8","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n9","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n10","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n11","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("Ailaunamoraaaaaaaaaaaaaaaaaa","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n13","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n14","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n15","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n16","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n17","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n18","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n19","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n20","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n21","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n22","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n23","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n24","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n25","666","13.123.124.4","NONE","signal2");
     cons <<WifiConnection::from("n26","666","13.123.124.4","NONE","signal2");
     cons2<<WifiConnection::from("abs1","677","123.123.123.123","SOME","Signal3");
     currentCons=cons;
}

void DebugWifiSystem::setWifiConnection(QString wifiName, QString wifiPassword,bool null_mgmt)
{
    qDebug()<<"wifi connection added with name "<< "wifiName "<<wifiName<<" password "<< wifiPassword<< "password requested: "<<null_mgmt;
}

int DebugWifiSystem::getWifiConnectionLength()
{
    qDebug()<<"returned cached wifiListLength";
    return currentCons.length();
}

QList<WifiConnection> DebugWifiSystem::getWifiConnectionList()
{
    qDebug()<<"wifi connection list requested";
    return currentCons;
}

void DebugWifiSystem::refreshConnectionList()
{
    qDebug()<<"refresh command executed";
    usedCons2=!usedCons2;
    if(usedCons2)currentCons=cons2;
    else currentCons=cons;
}

WifiConnection DebugWifiSystem::getWifiConnectionFromId(int id)
{
    return currentCons[id];
}

