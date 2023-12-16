import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Item{
    id:mainScreen
    property string deviceSelected:""
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
                text:qsTr("version") +" " + devInfo.firmwareVersion
                
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
            name:"fileImportMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:deviceImportScreen
            }
            PropertyChanges{
                target:header
                //: import header label
                text:qsTr("import")
            }
        },
        State{
            name:"fileImportFolderMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:fileImportScreen
            }
            PropertyChanges{
                target:header
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
        RowLayout{
            anchors.fill: parent
            spacing: 30
            MenuTile{
                Layout.preferredWidth: height*0.7
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignLeft
                Layout.margins: 5
                text:qsTr("export")
                imageSource: "qrc:/icons/plcExport.png"
                onClicked: {
                    mainScreen.state="fileExportMenu"
                }
            }
            MenuTile{

                Layout.preferredWidth: height*0.7
                Layout.fillHeight: true
                Layout.margins: 5
                Layout.alignment: Qt.AlignRight
                text:qsTr("import")
                imageSource: "qrc:/icons/plcImport.png"
                onClicked: {
                    mainScreen.state="fileImportMenu"
                }
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
        id:deviceImportScreen
        ImportDeviceSelector {
            id:devImpScrn

            onSelected:{
            mainScreen.deviceSelected = devImpScrn.selectedContent
            mainScreen.state="fileImportFolderMenu"
            }


        }
    }
    Component{
        id:fileImportScreen
        ImportFileSelector{
            selectedDevice: mainScreen.deviceSelected

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
        onSourceComponentChanged:
        {
            animation.running=true
            mainWidget.enabled=false
        }



        NumberAnimation{
            id:animation
            target:mainWidget.item
            property:"opacity"
            from:0
            to: 1
            duration:300
            easing.type:Easing.InExpo
            onFinished: mainWidget.enabled=true
        }
    }
    
}
