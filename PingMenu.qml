import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    id:root
    RowLayout{
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5

        CustomRect{
            radius: 20

            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout{
                anchors.margins: 5
                anchors.fill: parent
                IpKeyboardField{
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    id:localGateInput
                    signature:qsTr("localGate ip")
                    value:"0.0.0.0"
                }
                TextButton{
                    text:qsTr("ping")
                    Layout.fillWidth: true
                    Layout.preferredHeight:40
                    Layout.alignment: Qt.AlignCenter
                    onClicked:{
                        if(root.sanityCheck(localGateInput.value))
                        {
                            pingResultDisplay.requestType="local Gate"
                            pingResultDisplay.ip=localGateInput.value
                            pingResultDisplay.open()
                        }
                    }
                }
            }
        }
        CustomRect{
            radius: 20
            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout{

                anchors.margins: 5
                anchors.fill: parent
                IpKeyboardField{
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignCenter
                    id:webIpInput
                    signature:qsTr("web ip")
                    value:"0.0.0.0"
                }
                TextButton{
                    Layout.alignment: Qt.AlignCenter
                    Layout.fillWidth: true
                    Layout.preferredHeight:40
                    text:qsTr("ping")
                    onClicked:{
                    if(root.sanityCheck(webIpInput.value))
                    {
                        pingResultDisplay.requestType="web"
                        pingResultDisplay.ip=webIpInput.value
                        pingResultDisplay.open()
                    }

                    }
                }
            }
        }
    }

    Dialog{
        property string ip:"0.0.0.0"
        parent:Overlay.overlay
        property string requestType:"local Gate"
        id:pingResultDisplay
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        modal:true
        title:qsTr("ping result for ip: "  ) + ip
        Text{
            id:display
            text:qsTr("loading")
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
        footer:DialogButtonBox{

            TextButton{
                text:qsTr("close")
                onClicked: pingResultDisplay.close()
            }
        }
        Component.onCompleted:{
            if(requestType==="local Gate"){
                pingModel.startLocalPing(ip);
            }
            if(requestType==="web"){
                pingModel.startWebPing(ip);
            }
        }
        Connections{
            target:pingModel
            function onPingExecutionEnded(){
                display.text=pingModel.getPingResult()
            }

        }
    }
    function sanityCheck(a){
        var b=a.split(".").map((f)=>{return parseInt(f)}).filter((z)=>{return z>=0 && z<256 } )
        if(b.length===4){return b}
        return null
    }


}
