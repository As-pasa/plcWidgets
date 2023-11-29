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
        Connections{
            target:passwordModel
            function onPasswordCorrect(){
                mainScreen.state="mainScreen"
            }
            function onPasswordWrong(){
                infoBox.openWithValue("Wrong password")
            }
            function onHashFileNotExist(){
                infoBox.openWithValue("Hash file not found.\n Use root password")
            }
        }


        MainScreen{
            id:appScreen
            anchors.topMargin: 1
            anchors.fill:parent
            state:"networkMenu"
        }
        PasswordScreen {
            id:passwordScreen
            anchors.fill:parent



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
    Connections{
        target: screenModel
        function onCalibrationEnded(){
            showNormal();

        }
    }

    Dialog{
        id:infoBox
        property string val:""
        parent:Overlay.overlay
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        CustomLabel{

            anchors.fill: parent
            text:infoBox.val

        }
        function openWithValue(value){
            infoBox.val=value
            infoBox.open();
        }
        footer:DialogButtonBox{

            TextButton{
                text:qsTr("close")
                onClicked: infoBox.close()
            }
        }
    }



//    HeaderBar {
//        id:header
//        anchors.left: parent.left
//        anchors.right: parent.right
//        onCenterClicked: mainScreen.state="mainMenu"


//    }
//    ImportDeviceSelector {
//        id:rt2
//        selectedContent:"CD card"
//    }


//    ImportFileSelector {
//        anchors{
//            top:header.bottom
//            left:parent.left
//            right:parent.right
//            bottom:parent.bottom
//        }
//    }


}



