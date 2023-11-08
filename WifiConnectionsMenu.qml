import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    TestPgSelector {
        id: root
        anchors.margins: 15
        anchors.fill: parent
        property int selectedContent:0
        property bool somethingSelected: false
        signature: CustomRect{
            anchors.fill: parent


            RowLayout{
                anchors.fill: parent

                Text{
                    Layout.preferredWidth: parent.width/2
                    Layout.leftMargin: 15
                    //: wifi
                    text:qsTr("network name")
                }

                Text{
                    //: wifi
                    text:qsTr("protection")
                }
                Text{
                    //: wifi
                    text:qsTr("signal")
                }

            }
        }
        contextButtons:Item{
            anchors.fill: parent
            RowLayout{
                anchors.fill: parent
                TextButton{
                    text:qsTr("connect")
                    onClicked: {
                        if(root.somethingSelected)wifiConnectDialog.open()
                    }
                }
                TextButton{
                    text:qsTr("refresh")
                    onClicked: {
                        wifiModel.refresh()
                    }
                }
            }

        }
        delegate:
            CustomRect{
            Layout.preferredHeight: 50

            Layout.fillWidth: true
            property int idx : root.pageModel[index]
            color: (root.selectedContent===idx && root.somethingSelected)? clickedColor: defaultColor
            RowLayout{
                anchors.fill: parent
                Text{
                    Layout.leftMargin: 15
                    id:identifier
                    Layout.preferredWidth: parent.width/2
                    text:(wifiModel!==null)? wifiModel.fromId(idx).name: "";
                }
                Text{
                    id:security
                    text:(wifiModel!==null)? wifiModel.fromId(idx).security: "";
                }
                Text{
                    id:signal
                    text:(wifiModel!==null)? wifiModel.fromId(idx).signal1: "";
                }
            }
            MouseArea{
                id:clicker
                anchors.fill: parent
                onClicked: {
                    if(!root.somethingSelected){
                        root.somethingSelected=true
                        root.selectedContent=idx
                    }
                    else{
                        if(root.selectedContent===idx){
                            root.somethingSelected=false

                        }
                        else{
                            root.selectedContent=idx
                        }
                    }

                }
            }

        }







        model: range((wifiModel!==null)? wifiModel.declaredLength:0)
        rowsOnPage:root.height/(1.6*50)
        columnsOnPage:1
        function range(x){
            let declaredIndexes=[]
            for(var i = 0 ; i <wifiModel.declaredLength;i++){
                declaredIndexes.push(i)
            }
            return declaredIndexes
        }

        Dialog{
            id:wifiConnectDialog
            anchors.centerIn: parent
            width:parent.width/2
            height:parent.height/2
            modal:true

            TextKeyboardField{
                id:textInput
                anchors.centerIn: parent
                width: parent.width
                height:parent.height
                signature: qsTr("input password")
                value: ""
            }
            footer:DialogButtonBox{
                TextButton{
                    text:qsTr("connect")
                    onClicked: {
                        wifiModel.tryConnect(root.selectedContent,textInput.value)

                    }
                }
                TextButton{
                    text:qsTr("cancel")
                    onClicked: wifiConnectDialog.close()
                }
            }
            Component.onCompleted: title=qsTr("Connecting to wifi: ") + (root.somethingSelected && wifiModel!==null)? wifiModel.fromId(root.selectedContent).name : ""
        }

    }
}


