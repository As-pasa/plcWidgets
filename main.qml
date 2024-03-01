import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import "virtualKeyboards/"
import "widgets"
import "header"
import "screenComponents"


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 243
    title: qsTr("Tabs")
    BaseRect{id:colorPicker}
    color:colorPicker.backgroundColor
//    ScreenStates {
//        anchors.fill:parent
//        state:screenView.getScreen(Screens.TimeMenu)
//    }
    Item{
        anchors.fill: parent
        id:root
        property int role:1
        function process(ch){
            if(ch==="close"){
                keyBinder.clear(role)
                return
            }
            if(ch==="acc"){
                keyBinder.apply(role)
                return
            }
            keyBinder.process(role,ch)
        }
        ColumnLayout{
            anchors.fill: parent
            BaseText{
                id:header
                Layout.fillWidth: true
                Layout.preferredHeight: 40
                fontSize: fontBig
                Connections{
                    target:keyBinder
                    function onStateChanged(){
                        header.text=keyBinder.getState(root.role)
                    }
                }
                Component.onCompleted: header.text=keyBinder.getState(root.role)

            }
            Item{
                id:keyBoard
                function cSpan(str){
                    if(str==="0") return 3
                    return 1
                }
                function rSpan(str){
                   if(str==="acc"){
                       return 2
                           }
                    return 1
                   }

                Layout.fillHeight: true
                Layout.fillWidth: true
                GridLayout{
                    anchors.fill: parent
                    columns: 4
                    Repeater{
                        delegate:TextBtn{
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            Layout.rowSpan: keyBoard.rSpan(modelData)
                            Layout.columnSpan: keyBoard.cSpan(modelData)
                            text:modelData
                            onClicked: root.process(modelData)

                        }
                         model:"7 8 9 back 4 5 6 close 1 2 3 acc 0".split(" ")

                    }
                }
            }


        }
    }


}
