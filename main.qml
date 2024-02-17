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
    Rectangle{
        id:applicationScreen
        anchors.fill: parent
        color:"grey"
        Loader{
            id:appScreenLoader
            anchors.fill: parent

        }


        MainScreen{
            id:appScreen
            anchors.topMargin: 1
            anchors.fill:parent
            state:screenView.CurrenScreen
        }

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
            text:qsTr("start")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            onClicked: {
            screenModel.innerCalibrate()
            calibrationUIHelper.close()
            }
        }
    }
}
