import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0


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

            lft.onClicked:{console.log("foo")}
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
            mid.onClicked:{console.log("foo")}
            rgt.onClicked:{console.log("foo")}
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
        }

    }

    Component{
        id:dateSubmenu
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
                        BaseText{
                            id:mins
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"minute: "+rt.currentDate.getMinutes()
                            fontSize: fontBig

                        }
                        BaseText{
                            id:hours
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"hour: "+rt.currentDate.getHours()
                            fontSize: fontBig
                        }
                        BaseText{
                            id:day
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"day: "+rt.currentDate.getDay()
                            fontSize: fontBig
                        }
                        BaseText{
                            id:month
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"month: "+rt.currentDate.getMonth()
                            fontSize: fontBig
                        }
                        BaseText{
                            id:year
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text:"year: "+rt.currentDate.getFullYear()
                            fontSize: fontBig
                        }
                   }
               }
               BaseRect{
                   Layout.fillHeight: true
                   Layout.fillWidth: true

               }
            }
        }
    }
    Component{
        id:dayInput
        IntKeyboardScreen{

        }
    }
    Component{
        id:monthInput
        BaseRect{
        }
    }
    Component{
        id:yearInput
        BaseRect{
        }
    }
    Component{
        id:minuteInput
        BaseRect{
        }
    }
    Component{
        id:hourInput
        BaseRect{
        }
    }

}
