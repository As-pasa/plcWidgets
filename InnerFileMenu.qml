import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
Item{
    id:root
    
    CustomRect{
        id:colorPicker
        width: 0
        height:0
    }
    PageSelector{
        id:pgSelector
        anchors{
            margins: 15
            top:parent.top
            bottom:parent.bottom
            left:parent.left
            
        }
        pageSize: 8
        property var selectedContent:[]
        property var selectAll:false
        source:fileModel.innerFiles
        width:root.width*0.5
        delegate:TextButton{
            background: CustomRect{
                color:pgSelector.selectedContent.includes(text)?colorPicker.clickedColor:colorPicker.buttonColor
                
                
            }
            Connections{
                target:pgSelector
                function onSelectAllChanged(){
                    
                    background.color=pgSelector.selectedContent.includes(text)?colorPicker.clickedColor:colorPicker.buttonColor
                }
            }
            
            text:modelData
            anchors{
                left:parent.left
                right:parent.right
                margins:10
            }
            onClicked: {
                if(pgSelector.selectedContent.includes(text)){
                    pgSelector.selectedContent=pgSelector.selectedContent.filter( (a)=>{return a!==modelData} )
                    pgSelector.selectAll=!pgSelector.selectAll
                }
                else{
                    pgSelector.selectedContent.push(text)
                    pgSelector.selectAll=!pgSelector.selectAll
                }
            }
        }
    }

    CustomRect{
        id:buttonMenu
        radius: 20
        anchors{
            margins:15
            top:parent.top
            left:pgSelector.right
            right:parent.right
            bottom:parent.bottom
        }
        GridLayout{
            columns:1
            anchors{
                fill:parent
                margins:10
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                text:qsTr("select all")
                onClicked:{
                    
                    pgSelector.selectedContent=pgSelector.source
                    pgSelector.selectAll=!pgSelector.selectAll
                    pgSelector.selectedContentChanged()

                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:qsTr("drop all")
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked:{
                    pgSelector.selectedContent=[]
                    pgSelector.selectAll=!pgSelector.selectAll
                    pgSelector.selectedContentChanged()
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:qsTr("delete")
                Layout.fillHeight: true
                Layout.fillWidth: true 
                onClicked: {
                    fileDeleteDialog.open()
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:qsTr("refresh")
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.refreshInner()
                    
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:qsTr("format")
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    formatDialog.open()
                }

            }

            Dialog{
                id:fileDeleteDialog
                anchors.centerIn: parent
                width:parent.width
                height:parent.height
                modal:true
                CustomLabel{
                    anchors.fill: parent
                    text:qsTr("delete selected?")
                }
                footer:DialogButtonBox{
                    TextButton{
                        text:qsTr("Yes")
                        onClicked: {
                            fileModel.removeFile(pgSelector.selectedContent)
                            fileDeleteDialog.close()
                        }
                    }
                    TextButton{
                        text:qsTr("No")
                        onClicked: fileDeleteDialog.close()
                    }
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
                    text:qsTr("format disk?")
                }
                footer:DialogButtonBox{
                    TextButton{
                        text:qsTr("Yes")
                        onClicked: {
                            fileModel.formatInner()
                            formatDialog.close()
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
