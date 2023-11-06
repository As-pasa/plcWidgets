import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    id:root
    
    CustomRect{
        id:colorPicker
        width: 0
        height:0
    }
    PageSelector{
        id:pgSelector
        property string current:""
        anchors{
            margins: 15
            top:parent.top
            bottom:parent.bottom
            left:parent.left
        }
        pageSize: 8
        
        
        source:fileModel.outerSaveDirs
        width:root.width*0.5
        delegate:TextButton{
            background: CustomRect{
                color:pgSelector.current===modelData?colorPicker.clickedColor:colorPicker.buttonColor
            }
            text:modelData
            anchors{
                left:parent.left
                right:parent.right
                margins:10
            }
            onClicked: {
                if(pgSelector.current===modelData){
                    pgSelector.current=""
                    
                    
                    
                }
                else{
                    pgSelector.current=modelData
                    
                    
                    
                }
            }
        }
        
        Component.onCompleted: console.log(source)
        
    }

    CustomRect{
        radius: 20
        anchors{
            margins:15
            top:parent.top
            left:pgSelector.right
            right:parent.right
            bottom:parent.bottom
        }
        
        Loader{
            anchors.fill: parent
            sourceComponent: toolPane
            
        }
        
    }
    
    
    Component {
        id:toolPane
        GridLayout{
            columns:1
            anchors{
                fill:parent
                margins:10
            }
            TextButton{
                text:qsTr("import all files from directory")
                onClicked: formatDialog.open()
                Layout.fillWidth: true
            }
            TextButton{
                text:qsTr("refresh")
                Layout.fillWidth: true
                onClicked: {
                    fileModel.refreshOuter()
                }
            }
            Dialog{
                id:formatDialog
                anchors.centerIn: parent
                width:parent.width
                height:parent.height
                modal:true
                CustomLabel{
                    anchors.fill: parent
                    text:qsTr("delete all local files\n and import?")
                }
                footer:DialogButtonBox{
                    TextButton{
                        text:qsTr("Yes")
                        onClicked: {
                            if(pgSelector.current!==""){
                                fileModel.importFromFolder(pgSelector.current);
                                formatDialog.close()
                            }
                        }
                    }
                    TextButton{
                        text:qsTr("No")
                        onClicked: formatDialog.close()
                    }
                }
            }
        }
        
    }
    
}
