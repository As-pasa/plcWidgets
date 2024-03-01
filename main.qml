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
<<<<<<< HEAD
        id:root
        property int role:1
        property string inputed:""
        function process(ch){
            if(ch==="close"){
                inputed=""
                return
            }
            if(ch==="acc"){
                keyBinder.apply(role,inputed)
                return
            }
            if(ch==="back"){
                inputed=inputed.substring(0,inputed.length-1)
            }

            if(keyBinder.validate(role,inputed+ch)){
                inputed= inputed + ch
                return
            }

        }
        ColumnLayout{
            anchors.fill: parent
            BaseText{
                id:header
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                fontSize: fontBig
                text:root.inputed
=======
        color: "grey"
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
>>>>>>> parent of 1a364b7 (not working keyboard)
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
