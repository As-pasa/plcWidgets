import QtQuick 2.12
import QtQuick.Controls 2.5
import "virtualKeyboards"
import QtQuick.Layouts 1.12
Item{


CustomRect{
    id:timeZoneSegment
    radius:10
    anchors.fill: parent
    anchors.margins: 5
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5
        SignedLabel{
            id:currentTimeZone
            underLabel:"current time zone"
            text:timeModel.currentTimeZone
            
            
            
            Layout.preferredHeight:70
            Layout.fillWidth: true
            
            
        }
        TextButton{
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            text:"edit"
            onClicked:{
                timeZoneDialog.open()
                console.log(timeModel.currentTimeZone)
                foo.selectedContent=timeModel.currentTimeZone
            }
            enabled: (autoTZOption.toggled)?false:true
        }
        Item{
            Layout.preferredHeight:30
            Layout.fillWidth: true
            
            CustomCheckbox{
                id:autoTZOption

                anchors{
                    top:parent.top
                    bottom:parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                width:100

                text:"ATZ"
                toggled: timeModel.ATZStatus
                onToggledChanged: timeModel.ATZStatus=toggled
            }
        }
    }
    Dialog{
        parent: Overlay.overlay
        CustomRect{
            id:colorPicker
        }
        id:timeZoneDialog
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        modal:true
        TestPgSelector{
            id:foo
            anchors.fill: parent
            property string selectedContent:""
            model:{
                var a = [...timeModel.timeZones].sort()
                a
            }
            contextButtons: Item{
                anchors.fill: parent
                ColumnLayout{
                    anchors.fill: parent
                    TextButton{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text:"select"
                        onClicked: {
                            timeModel.setTimeZone(foo.selectedContent)
                            timeZoneDialog.close()
                        }
                    }
                    TextButton{
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text:"cancel"
                        onClicked: timeZoneDialog.close()
                    }
                }

            }
            columnsOnPage: 1
            rowsOnPage:timeZoneDialog.height/(1.6*30)
            signature: CustomLabel{
                text:"select new timezone"
                Layout.alignment: Qt.AlignHCenter
            }
            delegate:
                TextButton{
                Layout.fillWidth: true
                            background: CustomRect{
                                color:foo.selectedContent===modelData?colorPicker.clickedColor:colorPicker.buttonColor
                            }
                            text:modelData

                            onClicked: {
                                if(foo.selectedContent===modelData){
                                    foo.selectedContent=""



                                }
                                else{
                                    foo.selectedContent=modelData



                                }
                    }
                }

//                TextButton{
//                Layout.preferredHeight: 50
//                Layout.fillWidth: true
//                text:modelData
//                mainColor: (foo.selectedContent===modelData)? colorPicker.defaultColor:colorPicker.clickedColor
//                onClicked:{
//                    if(foo.selectedContent===modelData){
//                        foo.selectedContent=""
//                        console.log(1)
//                    }
//                    else{
//                        foo.selectedContent=modelData
//                    }
//                }

            }


        }
}
}
