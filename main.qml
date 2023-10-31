import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
ApplicationWindow {
    id: window
    visible: true
    width: 805
    height: 485
    title: qsTr("Tabs")
    Rectangle{
        id:mainScreen
        anchors.fill: parent
        color:"grey"
        MainScreen{
            id:appScreen
            anchors.topMargin: 5
            anchors.fill:parent
        }
        PasswordScreen {
            id:passwordScreen
            anchors.fill:parent
            onOpenGates: mainScreen.state="mainScreen"
        }
        states:[
            State{
                name:"passwordScreen"
                PropertyChanges {
                    target: appScreen
                    opacity:0
                    enabled:false
                }
                PropertyChanges {
                    target: passwordScreen
                    opacity:100
                    enabled:true

                }
            },
            State{
                name:"mainScreen"
                PropertyChanges {
                    target: passwordScreen
                    opacity:0
                    enabled:false
                }
                PropertyChanges {
                    target: appScreen
                    opacity:100
                    enabled:true

                }
            }
        ]
        state:"passwordScreen"
    }
    KeyboardInput{
        id: kKEYBOARDUNIT
        state:"ipInput"
    }





//    HeaderBar {
//        id:header
//        anchors.left: parent.left
//        anchors.right: parent.right
//        onCenterClicked: mainScreen.state="mainMenu"


//    }

//    anchors{
//        top:header.bottom
//        left:parent.left
//        right:parent.right
//        bottom:parent.bottom
//    }

}
