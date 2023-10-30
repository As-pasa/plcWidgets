import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
import "../"
Item{
    signal keyPressed(string key)

    //defalut function overriden in KeyboarDialog states
    property var rowSpanFunction: (a)=> {
                        if(a==="enter") return 2
                          return 1
                      }
    property var colSpanFunction: (a)=> {
                        if(a==="0")return 3
                           return 1
                       }
    property var model:"7 8 9 back 4 5 6 enter 1 2 3 0 cancel".split(" ") //default
    property var columnCount:4
    property bool shiftDown:false
    id:root
    GridLayout{
        id:lll
        anchors.fill: parent
        anchors.margins: 0
        columnSpacing: 2
        rowSpacing: 2
        columns:root.columnCount

        Repeater{
            model:root.model
            CustomRect{
                color:{
                   if(mainText.text==="shift"){
                    return (root.shiftDown)? "blue": Qt.darker("blue")
                   }
                   else return (mouseArea.containsPress)? "grey": Qt.darker("grey")
                }

                radius:5
                Text{
                    property string source:modelData.split("@@")[0]
                    id:mainText
                    color:"white"
                    font.pixelSize: 25
                    anchors.centerIn: parent
                    text:  {
                        if(source.length===1){

                            return (root.shiftDown)?source.toUpperCase() : source
                        }
                        else{
                            return source
                        }
                    }
                }
                Text{
                    id:shiftText
                    color:"white"
                    font.pixelSize: mainText.font.pixelSize/2
                    anchors.top:parent.top
                    anchors.right:parent.right
                    anchors.margins: 5
                    text: (modelData.split('@@')[1] !== undefined)? modelData.split("@@")[1] : ""
                }
                
                MouseArea{
                    id:mouseArea
                    anchors.fill: parent
                    onClicked: {
                        if(root.shiftDown){

                            if(shiftText.text==="") { root.keyPressed(mainText.text)}
                            else root.keyPressed(shiftText.text)
                        }
                        else{
                            root.keyPressed(mainText.text)
                        }
                    }
                    
                }
                
                Layout.minimumWidth: (parent.width - lll.columns*2*lll.columnSpacing)/lll.columns
                Layout.minimumHeight: (parent.height-lll.rows*2*lll.rowSpacing)/lll.rows
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.rowSpan:  root.rowSpanFunction(modelData)
                Layout.columnSpan: root.colSpanFunction(modelData)
                
            }
        }
        
    }
}
