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
        anchors{
            margins: 15
            top:parent.top
            bottom:parent.bottom
            left:parent.left
        }
        pageSize: 8
        property int selectedContentLength:0
        property var selectedContent:[]

        source:fileModel.innerFiles
        width:root.width*0.5
        delegate:TextButton{
            background: CustomRect{
                color:pgSelector.selectedContent.includes(text)?colorPicker.clickedColor:colorPicker.buttonColor
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


                    pgSelector.selectedContentChanged()
                }
                else{
                    pgSelector.selectedContent.push(text)


                    pgSelector.selectedContentChanged()
                }
            }
        }
        onSelectedContentChanged: {
            selectedContentLength=selectedContent.length
        }

    }
    CustomRect{
        radius:20
        id:usageDisplay
        anchors{
            margins:15
            top:parent.top
            right:parent.right
            left:pgSelector.right
            
        }
        height:parent.height*0.5  
        ColumnLayout{
            anchors.fill: parent
            anchors.margins: 15

            TimeDisplayLabel{
                underLabel: "Выбрано файлов"
                text: pgSelector.selectedContentLength
                Layout.fillWidth: true
                Layout.minimumHeight: 50
            }
            TimeDisplayLabel{
                underLabel: "free space on card"
                text: fileModel.outFreeMB
                Layout.fillWidth: true
                Layout.minimumHeight: 50
            }
        }
    }
    CustomRect{
        radius: 20
        anchors{
            margins:15
            top:usageDisplay.bottom
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
            columns:2
            anchors{
                fill:parent
                margins:10
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                text:"select all"
                onClicked:{

                    pgSelector.selectedContent=pgSelector.source

                    pgSelector.selectedContentChanged()
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"drop all"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked:{
                    pgSelector.selectedContent=[]

                    pgSelector.selectedContentChanged()
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"export"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileNameSelector.open()

                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"refresh"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.refreshInner()

                }
            }
        }
    }

    Dialog{
        id:fileNameSelector
        anchors.centerIn: parent
        width:parent.width/2
        height:parent.height/2
        modal:true
        TextKeyboardField{
            id:textInput
            anchors.centerIn: parent
            width: parent.width
            height:parent.height
            signature: "input backup folder name"
            value: ""
        }
        footer:DialogButtonBox{
            TextButton{
                text:"export"
                onClicked: {
                    if(textInput.value!==""){
                        fileModel.backupFiles(pgSelector.selectedContent,textInput.value)
                        fileNameSelector.close()
                    }
                }
            }
            TextButton{
                text:"cancel"
                onClicked: fileNameSelector.close()
            }
        }
    }
}
