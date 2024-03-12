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
    Layout.fillWidth: true
    Layout.fillHeight: true
    signal keyPressed(string v)
    id:root
    property var model:"Q W E R T Y U I O P A S D F G H J K L # Z X C V B N M Shift Space acc close back Switch".split(" ")

    GridLayout{
        anchors.fill: parent
        columns:10
        property var  ar : ["#","@"]
        Repeater{
            model:root.model
            delegate:
                TextBtn{
                onClicked:root.keyPressed(modelData)
                text:{
                    if(modelData==="#"){
                        return ""
                    }else return modelData
                }
                enabled:!(modelData==="#")
                color: (modelData==="#")? backgroundColor : (morea.containsPress)? clickColor:normalColor
                Layout.columnSpan: {
                    if(modelData==="Shift")return 3
                    else if(modelData==="Space") return 2
                    else if(modelData==="acc") return 2
                    else if(modelData==="Switch") return 2
                    else if(modelData==="close") return 2
                    else if(modelData==="back") return 2
                    else  return 1
                }
                
                
                
            }
            
        }
        
    }
}
