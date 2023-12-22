import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{

    TestPgSelector {
        id: root
        anchors.margins: 5
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
                    text:qsTr("name")
                }

                Text{
                    //: wifi
                    text:qsTr("secur")
                }
                Text{
                    //: wifi
                    text:qsTr("sign")
                }

            }
        }
        contextButtons:Item{
            anchors.fill: parent
            ColumnLayout{
                anchors.fill: parent
                TextButton{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text:qsTr("connect")
                    onClicked: {
                        if(root.somethingSelected)
                        {
                            wifiConnectDialog.idx=root.selectedContent
                            wifiConnectDialog.open()
                        }


                    }
                }
                TextButton{
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text:qsTr("refresh")
                    onClicked: {
                        wifiModel.refresh()
                    }
                }
            }

        }
        delegate:
            CustomRect{
            Layout.preferredHeight: 30

            Layout.fillWidth: true
            property int idx : root.pageModel[index]
            color: (root.selectedContent===idx && root.somethingSelected)? clickedColor: defaultColor
            RowLayout{
                anchors.fill: parent
                Text{
                    Layout.leftMargin: 15
                    id:identifier
                    property string startName:wifiModel.fromId(idx).name
                    Layout.preferredWidth: parent.width/2
                    text:{
                        if(wifiModel===null)return ""
                        else
                            var name=startName
                            if(name.length<= 1.6*(parent.width/2)/font.pixelSize){
                                return name
                            }
                            else{
                                const etalonLength=Math.floor(1.6*(parent.width/2)/font.pixelSize)

                                const [head,tail]= [name.slice(0,etalonLength - 8), name.slice(name.length-5)]
                                    console.log(head, tail)
                                return head+"..."+tail
                            }
                        }

                }
                Text{
                    id:security
                    text:{
                        if(wifiModel.fromId(idx).security==="WPA-PSK"){
                            "PWD"
                        }
                        else{
                           qsTr("None")
                        }

                        }
                }
                Text{
                    id:signal
                    text:(wifiModel!==null)? wifiModel.fromId(idx).signal1.split(" ")[0]: "";
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
        rowsOnPage:root.height/(1.6*30)
        columnsOnPage:1
        function range(x){
            let declaredIndexes=[]
            if(x===0){
                return []
            }
            for(var i = 0 ; i <wifiModel.declaredLength;i++){
                declaredIndexes.push(i)
            }
            return declaredIndexes
        }

        Dialog{
            property int idx:0
            id:wifiConnectDialog
            parent:Overlay.overlay
            anchors.centerIn: parent
            width:parent.width
            height:parent.height
            modal:true
            title:qsTr("Connect to: ")+ wifiModel.fromId(idx).name
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

        }

    }
}


