import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0


import "../widgets"
import "../header"
import "../screenComponents"


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
        }



    ]

    Component{
        id:mainMenu
        TopMenu {
            lft.text: "Network"
            mid.text: "Settings"
            rgt.text: "Backup"

            lft.source:"qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:{console.log("foo")}
            mid.onClicked:{console.log("foo")}
            rgt.onClicked:{console.log("foo")}
        }
    }
    Component{
        id:networkMenu
        TopMenu{
            lft.text: "Network"
            mid.text: "Settings"
            rgt.text: "Backup"

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
            lft.text: "Network"
            mid.text: "Settings"
            rgt.text: "Backup"

            lft.source:"qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:{console.log("foo")}
            mid.onClicked:{console.log("foo")}
            rgt.onClicked:{console.log("foo")}
        }
    }
    Component{
        id:fileMenu
        TopMenu{
            lft.text: "Network"
            mid.text: "Settings"
            rgt.text: "Backup"

            lft.source:"qrc:/icons2/Network_02.png"
            mid.source: "qrc:/icons2/BaseSettings_02.png"
            rgt.source:"qrc:/icons2/Files_02.png"

            lft.onClicked:{console.log("foo")}
            mid.onClicked:{console.log("foo")}
            rgt.onClicked:{console.log("foo")}
        }
    }
    Component{
        id:timeScreenMenu
        DoubleMenu{

        }

    }
}
