import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    TestPgSelector{
        id:root
        anchors.fill: parent
        anchors.margins: 5
        rowsOnPage:root.height/(1.6*30)
        columnsOnPage:1
        property string selectedContent:""
        signature:CustomLabel{
            anchors.fill: parent
            text:qsTr("select web interface to edit")
        }

        delegate: CustomRect{
            Layout.preferredHeight: 30
            Layout.fillWidth: true

            property int idx : root.pageModel[index]
            color: (root.selectedContent===identifier.text)? clickedColor: defaultColor

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

                    if(root.selectedContent=== modelData){
                        root.selectedContent=""
                    }
                    else{
                        root.selectedContent=modelData
                    }
                }
            }
        }
        contextButtons: TextButton{
            text:qsTr("edit")
            anchors.left:parent.left
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            onClicked:
            {
                if(root.selectedContent!=="")interfaceEditDialog.open()
            }
        }
        Dialog{
            id:interfaceEditDialog
            parent: Overlay.overlay
            anchors.centerIn: parent
            width:parent.width*0.9
            height:parent.height*0.9
            modal:true
            title:qsTr("editing net interface: ") + root.selectedContent
            RowLayout{
                anchors.fill: parent
                IpKeyboardField{
                    id:ip
                    Layout.fillWidth: true
                    width: parent.width
                    height:parent.height
                    signature:qsTr("input ip")
                    value: ""
                }
                IpKeyboardField{
                    id:mask
                    Layout.fillWidth: true
                    width: parent.width
                    height:parent.height
                    signature:qsTr("input mask")
                    value: ""
                }
                IpKeyboardField{
                    id:gate
                    Layout.fillWidth: true
                    width: parent.width
                    height:parent.height
                    signature:qsTr("input gate")
                    value: ""
                }
            }


            footer:DialogButtonBox{
                TextButton{
                    text:qsTr("connect")
                    onClicked: {
                        var k = [ip.value, mask.value, gate.value]
                        .map((ff)=> {return root.sanityCheck(ff)})
                        .filter((z)=>{return z!==null})
                        .map((x)=>{return x.map((y)=>{return y.toString()})})
                        .map((v)=> {return v.reduce((acc, val)=> {return acc+"."+val})})


                        if(k.length===3){
                            console.log("try to connect")
                            interfaceEditDialog.close()
                        }
                    }
                }
                TextButton{
                    text:qsTr("cancel")
                    onClicked: interfaceEditDialog.close()
                }
            }

        }
        function sanityCheck(a){
            var b=a.split(".").map((f)=>{return parseInt(f)}).filter((z)=>{return z>=0 && z<256 } )
            if(b.length===4){return b}
            return null
        }

    }
}


