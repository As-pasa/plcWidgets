import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    id:root
    property alias selectedContent : rt1.selectedContent
    signal selected()
    
    Connections{
        target:fileModel
        function onSavedWithStamp(a) {infoBox.openWithValue("file saved with stamp: "+a)}
        
    }
    
    
    TestPgSelector{
        anchors.fill: parent
        anchors.margins: 5
        id:rt1
        columnsOnPage: 1
        rowsOnPage: (workFieldHeight-2*spacing)/ (delegateHeight+spacing)
        property string selectedContent:""
        model: fileModel.detectedDevices
        property int delegateHeight:30
        
        contextButtons:
            Item{
             anchors.fill: parent
            ColumnLayout{
                 anchors.fill: parent
                TextButton{
                    text:"select"
                    onClicked:{
                        if(rt1.selectedContent!==""){
                            root.selected()
                        }
                        
                    }
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    
                }
                TextButton{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    text:"refresh"
                    onClicked: fileModel.refreshDevices()
                }
            }
            
        }
        
        delegate: CustomRect{
            
            Layout.preferredHeight: rt1.delegateHeight
            Layout.fillWidth: true
            color: (rt1.selectedContent===modelData)? clickedColor:defaultColor
            Text{
                anchors.fill: parent
                id:identifier
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                text:modelData
            }
            MouseArea{
                id:clicker
                anchors.fill: parent
                onClicked: {
                    if(rt1.selectedContent===modelData){
                        rt1.selectedContent=""
                    }
                    else{
                        rt1.selectedContent=modelData
                    }
                }
            }
        }
        
        signature: CustomLabel{
            anchors.fill: parent
            text:"select import device"
        }
    }
}
