import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
Item{
    id:mainScreen
    states:[
        State{
            name: "mainMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent:mainMenuComponent
            }
            PropertyChanges {
                target: header
                //: main screen header label
                text:qsTr("version 1.3")
                
            }
        },
        State{
            name: "networkMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:networkMenu
            }
            PropertyChanges {
                target: header
                //: network header label
                text:qsTr("Network")
                
            }
        },
        State{
            name: "settingsMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:settingsMenu
            }
            PropertyChanges {
                target: header
                //: settings header label
                text: qsTr("Settings")
                
            }
        },
        State{
            name: "backupMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:backupMenu
            }
            PropertyChanges {
                target: header
                //: files header label
                text:qsTr("Backup")
                
            }
        },
        State{
            name:"timeMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:timeScreenComponent
            }
            PropertyChanges{
                target:header
                //: timeMenu header label
                text:qsTr("time")
            }
        },
        State{
            name:"datetime"
            PropertyChanges{
                target:mainWidget
                sourceComponent:dateTimeMenu
            }
            PropertyChanges{
                target:header
                text:qsTr("date/time")
            }
        },
        State{
            name:"timeZone"
            PropertyChanges{
                target:mainWidget
                sourceComponent:timeZoneMenu
            }
            PropertyChanges{
                target:header
                text:qsTr("timeZone")
            }
        },

        State{
            name:"deviceInfoMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:deviceInfoComponent
            }
            PropertyChanges{
                target:header
                //: deviceInfo header label
                text:qsTr("info")
            }
        },
        State{
            name:"screenMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:screenMenu
            }
            PropertyChanges{
                target:header
                //: screenMenu header label
                text:qsTr("display")
            }

        },
        State{
            name:"fileExportMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent:exportMenu
            }
            PropertyChanges{
                target:header
                //: export header label
                text:qsTr("export")
            }
        },
        State{
            name:"innerFileMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent: innerFileMenu
            }
            PropertyChanges{
                target:header
                //: storage header label
                text:qsTr("storage")
            }

        },
        State{
            name:"fileImportMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:fileImportScreen
            }
            PropertyChanges{
                target:header
                //: import header label
                text:qsTr("import")
            }
        },
        State{
            name:"wifiConnectionMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:wifiConnectionMenu
            }
            PropertyChanges{
                target:header
                //: wifi header label
                text:qsTr("wifi")
            }
        },
        State{
            name: "netInterfacesMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent:netInterfaceMenu
            }
            PropertyChanges{
                target:header
                //: net interfaces header label
                text:qsTr("interfaces")
            }
        },
        State{
            name:"pingMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent:pingMenu
            }
            PropertyChanges{
                target:header
                //: ping header label
                text:qsTr("ping")
            }
        }
    ]
    
    
    HeaderBar {

        id:header
        enabled: blockSemaphore==0

        anchors.left: parent.left
        anchors.right: parent.right
        anchors{

            leftMargin: 5
            rightMargin: 5
        }
        onCenterClicked: mainScreen.state="mainMenu"
        
    }
    
    Component{
        id:mainMenuComponent
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcNet.png"
            centerImagePath: "qrc:/icons/plcInfo.png"
            rightImagePath: "qrc:/icons/plcBackup.png"
            leftText:qsTr("Network")
            centerText:qsTr("Settings")
            rightText:qsTr("Backup")
            
            onLeftClicked: mainScreen.state="networkMenu"
            onCenterClicked: mainScreen.state="settingsMenu"
            onRightClicked: mainScreen.state="backupMenu"
        }
    }
    Component{
        id:networkMenu
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcNet.png"
            centerImagePath: "qrc:/icons/plcWifi.png"
            rightImagePath: "qrc:/icons/plcPing.png"
            leftText:qsTr("interfaces")
            centerText:qsTr("wifi")
            rightText:qsTr("ping")

            onCenterClicked: mainScreen.state= "wifiConnectionMenu"
            onLeftClicked : mainScreen.state="netInterfacesMenu"
            onRightClicked: mainScreen.state= "pingMenu"
        }
    }
    Component{
        id: backupMenu
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcExport.png"
            centerImagePath: "qrc:/icons/plcStorage.png"
            rightImagePath: "qrc:/icons/plcImport.png"
            leftText:qsTr("export")
            centerText:qsTr("storage")
            rightText:qsTr("import")
            onCenterClicked: {
                mainScreen.state="innerFileMenu"
            }
            onLeftClicked: {
                mainScreen.state="fileExportMenu"
            }
            onRightClicked: {
                mainScreen.state="fileImportMenu"
            }
        }
        
    }
    Component{
        id:settingsMenu
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcTime.png"
            centerImagePath: "qrc:/icons/plcInfo.png"
            rightImagePath: "qrc:/icons/plcDisplay.png"
            leftText:qsTr("time")
            centerText:qsTr("info")
            rightText:qsTr("display")
            onLeftClicked: mainScreen.state="timeMenu"
            onCenterClicked: mainScreen.state="deviceInfoMenu"
            onRightClicked: mainScreen.state="screenMenu"
        }
    }
    Component{
        id:timeScreenComponent
        TimeScreen {
            onLeftClicked: mainScreen.state="datetime"
            onRightClicked:mainScreen.state="timeZone"
        }
    }
    Component{
        id: deviceInfoComponent
        DeviceInfo{


        }
    }
    Component{
        id:screenMenu
        ScreenMenu{

        }
    }

    Component{
        id:exportMenu
        FileExportScreen{

        }
    }
    Component{
        id:innerFileMenu
        InnerFileMenu{

        }
    }
    Component{
        id:fileImportScreen
        FileImportScreen {

        }
    }
    Component{
        id:wifiConnectionMenu
        WifiConnectionsMenu{

        }
    }
    Component{
        id:netInterfaceMenu
        NetInerfaces {
        }
    }
    Component{
        id:pingMenu
        PingMenu {
        }
    }
    Component{
        id: timeZoneMenu
        TimeZoneMenu{
        }
    }
    Component{
        id:dateTimeMenu
        DatetimeMenu{

        }
    }
    Loader{
        id:mainWidget
        anchors.top:header.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        sourceComponent: mainMenuComponent
        
    }
    
}
