import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{

    

    
    TestPgSelector{
        id:rt
        columnsOnPage: 1
        rowsOnPage: (workFieldHeight-2*spacing)/ (delegateHeight+spacing)
        property string selectedContent:""
        model: fileModel.detectedDevices
        property int delegateHeight:30
        anchors.fill: parent
        anchors.margins: 5
        contextButtons:
            Item{
             anchors.fill: parent
            ColumnLayout{
                 anchors.fill: parent
                TextButton{
                    text:"export"
                    onClicked:{
                        if(rt.selectedContent!==""){
                            fileModel.copyTo(rt.selectedContent)
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
            
            Layout.preferredHeight: rt.delegateHeight
            Layout.fillWidth: true
            color: (rt.selectedContent===modelData)? clickedColor:defaultColor
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
                    if(rt.selectedContent===modelData){
                        rt.selectedContent=""
                    }
                    else{
                        rt.selectedContent=modelData
                    }
                }
            }
        }
        
        signature: CustomLabel{
            anchors.fill: parent
            text:"select export device"
        }
    }
    
}
