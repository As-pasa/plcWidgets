import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    TestPgSelector{
        id:root
        model:range(netModel.declaredLength-1)
        anchors.fill: parent
        anchors.margins: 5
        rowsOnPage:root.height/(1.6*30)
        columnsOnPage:1
        property int selectedContent:0
        property bool somethingSelected: false
        signature:CustomLabel{
            anchors.fill: parent
            text:qsTr("select web interface to edit")
        }

        delegate: CustomRect{

            Layout.preferredHeight: 30
            Layout.fillWidth: true
            id:rrr
            property int idx : root.pageModel[index]
            color: (root.selectedContent===idx && root.somethingSelected)? clickedColor: defaultColor

                Text{
                    anchors.fill: parent

                    id:identifier
                    horizontalAlignment: Qt.AlignHCenter
                    verticalAlignment: Qt.AlignVCenter
                    text:netModel.fromId(rrr.idx).name
                }
            MouseArea{
                id:clicker
                anchors.fill: parent
                onClicked: {
                    if(!root.somethingSelected){
                        root.somethingSelected=true
                        root.selectedContent=rrr.idx
                    }
                    else{
                        if(root.selectedContent===rrr.idx){
                            root.somethingSelected=false

                        }
                        else{
                            root.selectedContent=rrr.idx
                        }
                    }

                }
            }
        }
        contextButtons:ColumnLayout{
            anchors.fill: parent
            TextButton{
            text:qsTr("refresh")
            onClicked: netModel.refresh();
            }

            TextButton{
            text:qsTr("edit")
            onClicked:
            {
                if(root.somethingSelected)interfaceEditDialog.open()
            }
        }


        }
        Dialog{
            id:interfaceEditDialog
            parent: Overlay.overlay
            anchors.centerIn: parent
            width:parent.width
            height:parent.height
            modal:true
            title:qsTr("editing net interface: ") + netModel.fromId(root.selectedContent).name
            RowLayout{

                anchors.fill: parent
                CustomCheckbox{
                    id:useDhcp
                    text:"DHCP"
                    Layout.preferredHeight:40
                    Layout.preferredWidth: 100
                    toggled: netModel.fromId(root.selectedContent).dhcp
                }

                IpKeyboardField{
                    id:ip
                    enabled: !useDhcp.toggled
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    signature:qsTr("ip")
                    value: netModel.fromId(root.selectedContent).ip
                }
                IpKeyboardField{
                    id:mask
                     enabled: !useDhcp.toggled
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    signature:qsTr("mask")
                    value: netModel.fromId(root.selectedContent).mask
                }
                IpKeyboardField{
                    id:gate
                     enabled: !useDhcp.toggled
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    signature:qsTr("gate")
                    value: netModel.fromId(root.selectedContent).gate
                }
            }


            footer:DialogButtonBox{
                TextButton{
                    text:qsTr("connect")
                    onClicked: {
                        if(useDhcp.toggled){

                        }

                        var k = [ip.value, mask.value, gate.value]
                        .map((ff)=> {return root.sanityCheck(ff)})
                        .filter((z)=>{return z!==null})
                        .map((x)=>{return x.map((y)=>{return y.toString()})})
                        .map((v)=> {return v.reduce((acc, val)=> {return acc+"."+val})})


                        if(k.length===3){
                            netModel.setInterface(netModel.fromId(root.selectedContent).name, ip.value, mask.value, gate.value, useDhcp.toggled)
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
    function range(x){
        if(x===0)return []
        let declaredIndexes=[]
        for(var i = 0 ; i <netModel.declaredLength;i++){
            declaredIndexes.push(i)
        }

        return declaredIndexes
    }
}


