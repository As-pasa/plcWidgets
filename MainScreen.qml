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
                text:"version 1.3"
                
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
                text:"Сеть"
                
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
                text:"Настройки"
                
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
                text:"Рез. копирование"
                
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
                text:"Время"
            }
        },
        State{
            name:"deviceInfoMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:deviceInfoComponent
            }
        },
        State{
            name:"screenMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:screenMenu
            }

        },
        State{
            name:"fileExportMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent:exportMenu

            }
        },
        State{
            name:"innerFileMenu"
            PropertyChanges {
                target: mainWidget
                sourceComponent: innerFileMenu

            }

        },
        State{
            name:"fileImportMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:fileImportScreen
            }
        },
        State{
            name:"wifiConnectionMenu"
            PropertyChanges{
                target:mainWidget
                sourceComponent:wifiConnectionMenu
            }
        }

        
    ]
    
    
    HeaderBar {

        id:header
        enabled: blockSemaphore==0

        anchors.left: parent.left
        anchors.right: parent.right
        anchors{

            leftMargin: 15
            rightMargin: 15
        }
        onCenterClicked: mainScreen.state="mainMenu"
        
    }
    
    Component{
        id:mainMenuComponent
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcNet.png"
            centerImagePath: "qrc:/icons/plcInfo.png"
            rightImagePath: "qrc:/icons/plcBackup.png"
            leftText:"Сеть"
            centerText:"Настройки"
            rightText:"Файлы"
            
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
            leftText:"Сетевые интерфейсы"
            centerText:"Wifi"
            rightText:"Тестирование подключения"

            onCenterClicked: mainScreen.state= "wifiConnectionMenu"
        }
    }
    Component{
        id: backupMenu
        MainMenuTiles{
            leftImagePath: "qrc:/icons/plcExport.png"
            centerImagePath: "qrc:/icons/plcStorage.png"
            rightImagePath: "qrc:/icons/plcImport.png"
            leftText:"Экспорт данных"
            centerText:"Управление хранилищем"
            rightText:"Импорт данных"
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
            leftText:"Время"
            centerText:"Об устройстве"
            rightText:"Экран"
            onLeftClicked: mainScreen.state="timeMenu"
            onCenterClicked: mainScreen.state="deviceInfoMenu"
            onRightClicked: mainScreen.state="screenMenu"
        }
    }
    Component{
        id:timeScreenComponent
        TimeScreen{
            id:timeScreen
            onBlockingChanged: {
                if(blocking==true){
                    header.blockSemaphore+=1
                }
                else{
                    header.blockSemaphore-=1
                }
            }
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
    Loader{
        id:mainWidget
        anchors.top:header.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        sourceComponent: mainMenuComponent
        
    }
    
}
