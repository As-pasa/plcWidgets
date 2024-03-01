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
                screenView.getScreen(Screens.TopMenu)
            }
            PropertyChanges {
                target: mainWidget
                sourceComponent:mainMenuComponent
            }
        },
        State{
            name: screenView.getScreen(Screens.NetMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:networkMenu
            }
        },
        State{
            name: screenView.getScreen(Screens.BaseMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:settingsMenu
            }
        },
        State{
            name: screenView.getScreen(Screens.FileMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:backupMenu
            }
        },
        State{
            name:screenView.getScreen(Screens.TimeMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:timeScreenComponent
            }
        },
        State{
            name:screenView.getScreen(Screens.DateSubmenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:dateTimeMenu
            }
        },
        State{
            name:screenView.getScreen(Screens.TimeZoneSubmenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:timeZoneMenu
            }
        },

        State{
            name:screenView.getScreen(Screens.AboutMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:deviceInfoComponent
            }
        },
        State{
            name:screenView.getScreen(Screens.DisplayMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:screenMenu
            }

        },
        State{
            name:screenView.getScreen(Screens.ExportMenu)
            PropertyChanges {
                target: mainWidget
                sourceComponent:exportMenu
            }
        },

        State{
            name:screenView.getScreen(Screens.ImportMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:deviceImportScreen
            }
        },
        State{
            name:screenView.getScreen(Screens.ImportDirSubmenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:fileImportScreen
            }
        },
        State{
            name:screenView.getScreen(Screens.WifiMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:wifiConnectionMenu
            }
        },
        State{
            name: screenView.getScreen(Screens.NetInterfaceMenu)
            PropertyChanges {
                target: mainWidget
                sourceComponent:netInterfaceMenu
            }
        },
        State{
            name:screenView.getScreen(Screens.PingMenu)
            PropertyChanges {
                target: mainWidget
                sourceComponent:pingMenu
            }
        },
        State{
            name:screenView.getScreen(Screens.PasswordMenu)
            PropertyChanges{
                target:mainWidget
                sourceComponent:passwordScreen
            }
        },
        State{
            name:screenView.getScreen(Screens.PasswordRecovery)
            PropertyChanges{
                target:mainWidget
                sourceComponent:passwordRecoveryScreen
            }
        },
        State{
            name:screenView.getScreen(Screens.AppMessager)
            PropertyChanges{
                target:mainWidget
                sourceComponent:appMessager
            }
        }
    ]
    
    
    HeaderBar {
        id:header
        anchors.left: parent.left
        anchors.right: parent.right
        anchors{
            leftMargin: 5
            rightMargin: 5
        }
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
            
            onLeftClicked: screenController.goToScreen(Screens.NetMenu)// screenView.setCurrentScreen(Screens.NetMenu)
            onCenterClicked: screenController.goToScreen(Screens.BaseMenu)
            onRightClicked: screenController.goToScreen(Screens.FileMenu)
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

            onCenterClicked: screenController.goToScreen(Screens.WifiMenu)
            onLeftClicked : screenController.goToScreen(Screens.NetInterfaceMenu)
            onRightClicked: screenController.goToScreen(Screens.PingMenu)
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
    Component{
        id:passwordScreen
        PasswordScreen{
        }
    }
    Component{
        id:passwordRecoveryScreen
        PasswordRecoveryScreen{
        }
    }
    Component{
        id:appMessager
        AppMessager{
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
