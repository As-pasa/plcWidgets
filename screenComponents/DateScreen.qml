import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import KeyboardService 1.0
import "../widgets"
import "../header"
import "../screenComponents"
import "../QmlKeyboard"

Item{
    id: rt
    property date currentDate:timeModel.currentTime
    RowLayout{
        anchors.fill: parent
        BaseRect{
            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout{
                anchors.fill: parent
                InputBtn {
                    btnEnabled: !root.ntpStatus
                    id:minutes
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"minute: "+rt.currentDate.getMinutes()
                    inputScreenState: Screens.MinuteInput
                    
                }
                InputBtn {
                    btnEnabled: !root.ntpStatus
                    id:hours
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"hour: "+rt.currentDate.getHours()
                    inputScreenState: Screens.HourInput
                    
                }
                
                InputBtn{
                    btnEnabled: !root.ntpStatus
                    id:day
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"day: "+rt.currentDate.getDate()
                    inputScreenState:Screens.DayInput
                }
                InputBtn{
                    btnEnabled: !root.ntpStatus
                    id:month
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"month: "+rt.currentDate.getMonth()
                    inputScreenState: Screens.MonthInput
                }
                InputBtn{
                    btnEnabled: !root.ntpStatus
                    id:year
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"year: "+rt.currentDate.getFullYear()
                    inputScreenState: Screens.YearInput
                }
            }
        }
        BaseRect{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Item{
                id:root
                property bool ntpStatus:timeModel.NIPStatus
                anchors.centerIn: parent
                height:100
                width:100
                ColumnLayout{
                    anchors.fill: parent
                    BaseText{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        fontSize: fontBig
                        text:{
                            if(root.ntpStatus){
                                "NTP: ON"
                            }else{
                                "NTP: OFF"
                            }
                        }
                        
                    }
                    TextBtn{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text:{
                            if(root.ntpStatus){
                                "Turn off"
                            }else{
                                "Turn on"
                            }
                        }
                        onClicked:timeModel.setNIPStatus(!root.ntpStatus)
                        
                    }
                }
            }
        }
    }
}
