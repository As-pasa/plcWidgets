import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 243
    title: qsTr("Tabs")
    onWidthChanged: console.log(width,height)
    Rectangle{
        id:mainScreen
        anchors.fill: parent
        color:"grey"
        MainScreen{
            id:appScreen
            anchors.topMargin: 1
            anchors.fill:parent
            state:"timeMenu"
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
        state:"mainScreen"
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
//    TimeScreen{
//        anchors{
//            top:header.bottom
//            left:parent.left
//            right:parent.right
//            bottom:parent.bottom
//            margins:5
//        }
//    }



}
