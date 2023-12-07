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
            state:"mainMenu"
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
        Connections{
            target:messager
            function onMessageFound(a){
                infoBox.openWithValue(a)
            }
        }

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

    Dialog{
        id:confUI
        Connections{
            target:confirmator
            function onConfirmRequested(s){
                confUI.openWithValue(s)
            }
        }
        function openWithValue(value){
            confUI.val=value
            confUI.open();

        }
        property string val:""
        parent:Overlay.overlay
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        CustomLabel{

            anchors.fill: parent
            text:confUI.val

        }
        footer:DialogButtonBox{
            TextButton{
                text:qsTr("accept")
                onClicked: {
                     confUI.close()
                    confirmator.accept()

                }
            }
            TextButton{
                text:qsTr("close")
                onClicked: confUI.close()
            }

        }
    }
    CustomRect{
        radius: 0
        id: calibrationUIHelper
        Component.onCompleted: console.log("qml changed")
        function open(){
            calibrationUIHelper.enabled= true
            calibrationUIHelper.visible= true
        }
        function close(){
            calibrationUIHelper.enabled= false
            calibrationUIHelper.visible= false

        }
        Connections{
            target:screenModel
            function onCalibrationStarted(){
                calibrationUIHelper.open()
            }
        }
        Connections{
            target:screenModel
            function onCalibrationEnded(){
                calibrationUIHelper.close()
            }
        }

        enabled: false
        visible: false
        parent: Overlay.overlay
        anchors.fill: parent
        TextButton{
            text:"1"
            anchors.top:parent.top
            anchors.left: parent.left
            width:20
            height:20

        }
        TextButton{
            text:"2"
            anchors.top:parent.top
            anchors.right: parent.right
            width:20
            height:20

        }
        TextButton{
            text:"3"
            anchors.bottom:parent.bottom
            anchors.right: parent.right
            width:20
            height:20

        }
        TextButton{
            text:"4"
            anchors.bottom:parent.bottom
            anchors.left: parent.left
            width:20
            height:20

        }
        TextButton{
            text:"5"
            anchors.centerIn: parent
            width:20
            height:20
        }
        TextButton{
            text:"start"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            onClicked: {
            screenModel.innerCalibrate()
            calibrationUIHelper.close()
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