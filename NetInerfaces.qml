import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    TestPgSelector{
        id:root
        model:range(netModel.declaredLength)
        anchors.fill: parent
        anchors.margins: 5
        rowsOnPage:(workFieldHeight-2*spacing)/ (30+spacing)
        columnsOnPage:1
        Component.onCompleted: console.log(model)
        Connections{
        target:netModel
        function onDeclaredLengthChanged(a){
            console.log(a)
            for(var z = 0 ; z < a;z++){
                console.log(netModel.fromId(z))
            }
        }
        }

        property int selectedContent:0
        property bool somethingSelected: false
        signature:CustomLabel{
            anchors.fill: parent
            text:qsTr("net interface")
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
                Layout.fillHeight: true
                Layout.fillWidth: true
            text:qsTr("refresh")
            onClicked: netModel.refresh();
            }

            TextButton{
                Layout.fillHeight: true
                Layout.fillWidth: true
            text:qsTr("edit")
            onClicked:
            {
                if(root.somethingSelected)interfaceEditDialog.openWith(root.selectedContent)
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
            title:qsTr("interface: ") + netModel.fromId(root.selectedContent).name
            RowLayout{

                anchors.fill: parent
                CustomCheckbox{
                    id:useDhcp
                    text:"DHCP"
                    Layout.preferredHeight:40
                    Layout.preferredWidth: 100
                    toggled: netModel.fromId(root.selectedContent).dhcp
                    onToggledChanged: {
                        if(toggled){
                            netModel.setInterface(netModel.fromId(root.selectedContent).name, ip.value, mask.value, gate.value, useDhcp.toggled)
                            interfaceEditDialog.close()
                        }
                    }


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
                    text:qsTr("save")
                    onClicked: {
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
            function openWith(idx){
                title= qsTr("interface: ") + netModel.fromId(root.selectedContent).name
                useDhcp.toggled=netModel.fromId(root.selectedContent).dhcp
                ip.value=netModel.fromId(root.selectedContent).ip
                mask.value=netModel.fromId(root.selectedContent).mask
                gate.value=netModel.fromId(root.selectedContent).gate
                interfaceEditDialog.open()
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


