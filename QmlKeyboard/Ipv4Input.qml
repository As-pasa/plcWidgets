import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import KeyboardService 1.0
import "../widgets"
import "../header"
import "../screenComponents"
import "../QmlKeyboard"

Item{
    property int role:1
    id:root
    KeyboardInputProcessor {
        id: textProcessor
        role:root.role
        
    }
    ColumnLayout{
        anchors.fill: parent
        BaseText{
            id:header
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            fontSize: fontBig
            text:textProcessor.txt
            
            
        }
        Item{
            id:keyBoard
            function cSpan(str){
                if(str==="0") return 2
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
                        onClicked:textProcessor.process(text)
                        
                        
                    }
                    model:"7 8 9 back 4 5 6 close 1 2 3 acc 0 .".split(" ")
                    
                }
            }
        }
        
        
    }
}
