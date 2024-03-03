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

BaseScreen{

    states:[
        State{
            name: {
                screenView.getScreen(Screens.TopMenu)
            }
            PropertyChanges {
                target: main
                sourceComponent:mainMenu
            }
        },
        State{
            name: {
                screenView.getScreen(Screens.NetMenu)
            }
            PropertyChanges {
                target: main
                sourceComponent:networkMenu
            }
        },
        State{
            name: {
                screenView.getScreen(Screens.BaseMenu)
            }
            PropertyChanges {
                target: main
                sourceComponent:baseMenu
            }
        },
        State{
            name: {
                screenView.getScreen(Screens.FileMenu)
            }
            PropertyChanges {
                target: main
                sourceComponent:fileMenu
            }
        },
        State{
            name: {
                screenView.getScreen(Screens.TimeMenu)
            }
            PropertyChanges {
                target: main
                sourceComponent:timeScreenMenu
            }
        },
        State{
            name: screenView.getScreen(Screens.DateSubmenu)
            PropertyChanges{
                target:main
                sourceComponent:dateSubmenu
            }
        },
        State{
            name:screenView.getScreen(Screens.DayInput)
            PropertyChanges {
                target: main
                sourceComponent:dayInput

            }
        },
        State{
            name:screenView.getScreen(Screens.MonthInput)
            PropertyChanges {
                target: main
                sourceComponent:monthInput
            }
        },
        State{
            name:screenView.getScreen(Screens.YearInput)
            PropertyChanges {
                target: main
                sourceComponent:yearInput
            }
        },
        State{
            name:screenView.getScreen(Screens.HourInput)
            PropertyChanges {
                target: main
                sourceComponent:hourInput

            }
        },
        State{
            name:screenView.getScreen(Screens.MinuteInput)
            PropertyChanges {
                target: main
                sourceComponent:minuteInput

            }
        },
        State{
            name:screenView.getScreen(Screens.TimeZoneInput)
            PropertyChanges{
                target:main
                sourceComponent:timeZoneInput
            }
        },
        State{
            name:screenView.getScreen(Screens.AppMessager)
            PropertyChanges {
                target: main
                sourceComponent: appMessageScreen

            }
        },
        State{
            name:screenView.getScreen(Screens.DisplayMenu)
            PropertyChanges {
                target: main
                sourceComponent:brightnessPicker

            }
        },
        State{
            name:screenView.getScreen(Screens.AboutMenu)
            PropertyChanges {
                target: main
                sourceComponent:aboutMenu

            }
        },
        State{
            name:screenView.getScreen(Screens.NetInterfaceMenu)
            PropertyChanges {
                target: main
                sourceComponent:interfaceSelector
            }

        },
        State{
            name:screenView.getScreen(Screens.NetInterfaceEditor)
            PropertyChanges{
                target:main
                sourceComponent:interfaceEditor
            }
        }





    ]

    Component{
        id:mainMenu
        TopMenu {
            lft.text: "Network"
            mid.text: "Settings"
            rgt.text: "Backup"

            lft.source: "qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source: "qrc:/icons2/Files_02.png"

            lft.onClicked:screenController.goToScreen(Screens.NetMenu)
            mid.onClicked:screenController.goToScreen(Screens.BaseMenu)
            rgt.onClicked:screenController.goToScreen(Screens.FileMenu)
        }
    }
    Component{
        id:networkMenu
        TopMenu{
            lft.text: "Interfaces"
            mid.text: "Wifi"
            rgt.text: "Ping"

            lft.source:"qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:screenController.goToScreen(Screens.NetInterfaceMenu)
            mid.onClicked:{console.log("foo")}
            rgt.onClicked:{console.log("foo")}
        }
    }
    Component{
        id:baseMenu
        TopMenu{
            lft.text: "Time"
            mid.text: "Info"
            rgt.text: "Brightness"

            lft.source:"qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:screenController.goToScreen(Screens.TimeMenu)
            mid.onClicked:screenController.goToScreen(Screens.AboutMenu)
            rgt.onClicked:screenController.goToScreen(Screens.DisplayMenu)
        }
    }
    Component{
        id:fileMenu
        DoubleMenu{
            lft.text: "Import"
            rgt.text: "Export"
            lft.source:"qrc:/icons2/Network_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:{console.log("foo")}

            rgt.onClicked:{console.log("foo")}
        }


    }
    Component{
        id:timeScreenMenu
        DoubleMenu{
            lft.text: "Date/Time"
            rgt.text: "Time Zone"
            lft.onClicked: screenController.goToScreen(Screens.DateSubmenu)
            rgt.onClicked: screenController.goToScreen(Screens.TimeZoneInput)
        }

    }

    Component{
        id:dateSubmenu
        DateScreen {
            id: rt
        }
    }
    Component{
        id:dayInput
        IntKeyboardScreen{
            role:KeyRole.Day
        }
    }
    Component{
        id:monthInput
        IntKeyboardScreen{
            role:KeyRole.Month
        }
    }
    Component{
        id:yearInput
        IntKeyboardScreen{
            role:KeyRole.Year
        }
    }
    Component{
        id:minuteInput
        IntKeyboardScreen{
            role:KeyRole.Minute

        }
    }
    Component{
        id:hourInput
        IntKeyboardScreen{
            role:KeyRole.Hour
        }
    }
    Component{
        id:timeZoneInput
        PageBasedSelector {
            model:timeModel.timeZones
            onTriggered:(a)=>{
                        let tz1=timeModel.currentTimeZone
                        timeModel.setTimeZone(a)
                            screenController.showInfoWithText("successfully changed timezone.\n"+tz1+"\n to \n"+timeModel.currentTimeZone)
                        }}
    }
    Component{
        id:appMessageScreen
        BaseText{
            text:messager.message
        }
    }
    Component{
        id:brightnessPicker
        RowLayout{
            id:root
            property int selectedValue:25
            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
                ColumnLayout{
                    anchors.fill: parent
                    TextBtn{
                        color:(root.selectedValue===25)? normalColor:labelColor
                        text:"25%"
                        onClicked: root.selectedValue=25
                    }
                    TextBtn{
                        color:(root.selectedValue===100)? normalColor:labelColor
                        text:"100%"
                        onClicked:root.selectedValue=100
                    }
                }
            }
            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
                ColumnLayout{
                    anchors.fill: parent
                    TextBtn{
                        color:(root.selectedValue===50)? normalColor:labelColor
                        text:"50%"
                        onClicked:root.selectedValue=50

                    }
                    TextBtn{
                        color:(root.selectedValue===75)? normalColor:labelColor
                        text:"75%"
                        onClicked: root.selectedValue=75
                    }

                }
            }
        }

    }
    Component{
        id:aboutMenu
        RowLayout{
            Item{
                Layout.fillHeight: true
                Layout.fillWidth: true
                ColumnLayout{
                    anchors.fill: parent
                    BaseText{
                        text:devInfo.deviceName
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                    BaseText{
                        text:devInfo.deviceType
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                    BaseText{
                        text:devInfo.firmWare
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                    BaseText{
                        text:devInfo.firmWareDate
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
            TextBtn{
                Layout.fillWidth: false
                Layout.preferredWidth: 100
                text:"change\n password"
            }
        }
    }
    Component{
        id:interfaceSelector
        PageBasedSelector{
            model:"1 2 3 4 5 6 7 8 9".split(" ")
            onTriggered: (a)=>screenController.goToScreen(Screens.NetInterfaceEditor)
        }
    }
    Component{
        id:interfaceEditor
        Item{
            RowLayout{
                anchors.fill:parent
                BaseRect{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    ColumnLayout{
                        anchors.fill: parent
                        InputBtn{
                            Layout.fillHeight: true
                            fontSize: fontSmall
                            Layout.fillWidth: true
                            text:"ip: 123.123.123.123"
                            btnEnabled: !dhcp.dhcpStatus
                        }
                        InputBtn{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            fontSize: fontSmall
                            btnEnabled: !dhcp.dhcpStatus
                            text:"mask: 255.255.255.255"
                        }
                        InputBtn{
                            btnEnabled: !dhcp.dhcpStatus
                            fontSize: fontSmall
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"gate: 123.543.435.123"
                        }
                    }
                }
                BaseRect{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Item{
                        id:dhcp
                        width: 100
                        height: 100
                        property bool dhcpStatus:false
                        anchors.centerIn: parent
                        ColumnLayout{
                            anchors.fill: parent
                            BaseText{
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                fontSize: fontBig
                                text:{
                                    if(dhcp.dhcpStatus){
                                        "DHCP: ON"
                                    }else{
                                        "DHCP: OFF"
                                    }
                                }

                            }
                            TextBtn{
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                text:{
                                    if(dhcp.dhcpStatus){
                                        "Turn off"
                                    }else{
                                        "Turn on"
                                    }
                                }
                                onClicked:console.log("foo")

                            }
                        }
                    }
                }
            }
        }
    }
}
