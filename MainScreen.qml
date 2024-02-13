import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ScreenService 1.0
Item{
    id:mainScreen
    property string deviceSelected:""
    states:[
        State{
            name: {
                console.log("AAAAA",Screens.TopMenu)
                screenView.getScreen(Screens.TopMenu)
            }
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
            name: screenView.getScreen(Screens.NetMenu)
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
            name: screenView.getScreen(Screens.BaseMenu)
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
            name: screenView.getScreen(Screens.FileMenu)
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
            name:screenView.getScreen(Screens.TimeMenu)
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
            name:screenView.getScreen(Screens.DateSubmenu)
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
            name:screenView.getScreen(Screens.TimeZoneSubmenu)
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
            name:screenView.getScreen(Screens.AboutMenu)
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
            name:screenView.getScreen(Screens.DisplayMenu)
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
            name:screenView.getScreen(Screens.ExportMenu)
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
            name:screenView.getScreen(Screens.ImportMenu)
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
            name:screenView.getScreen(Screens.ImportDirSubmenu)
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
            name:screenView.getScreen(Screens.WifiMenu)
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
            name: screenView.getScreen(Screens.NetInterfaceMenu)
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
            name:screenView.getScreen(screenView.PingMenu)
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
            
            onLeftClicked:screenView.setCurrentScreen(Screens.NetMenu)
            onCenterClicked: screenView.setCurrentScreen(Screens.BaseMenu)
            onRightClicked: screenView.setCurrentScreen(Screens.FileMenu)
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

            onCenterClicked: screenView.setCurrentScreen(Screens.WifiMenu)
            onLeftClicked : screenView.setCurrentScreen(Screens.NetInterfaceMenu)
            onRightClicked: screenView.setCurrentScreen(Screens.PingMenu)
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
                    screenView.setCurrentScreen(Screens.ExportMenu)
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
                    screenView.setCurrentScreen(Screens.ImportMenu)
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

            onLeftClicked: screenView.setCurrentScreen(Screens.TimeMenu)
            onCenterClicked:screenView.setCurrentScreen(Screens.AboutMenu)
            onRightClicked: screenView.setCurrentScreen(Screens.DisplayMenu)
        }
    }
    Component{
        id:timeScreenComponent
        TimeScreen {
            onLeftClicked: screenView.setCurrentScreen(Screens.DateSubmenu)
            onRightClicked:screenView.setCurrentScreen(Screens.TimeZoneSubmenu)
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
            screenView.setCurrentScreen(Screens.ImportDirSubmenu)
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
