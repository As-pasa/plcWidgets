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
                    signature:qsTr("ip")
                    value:"8.8.8.8"
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

                            pingResultDisplay.openWith(localGateInput.value)
                        }
                    }
                }
            }
        }
    }

    Dialog{
        property string ip:"8.8.8.8"
        parent:Overlay.overlay
        property string requestType:"local Gate"
        id:pingResultDisplay
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        modal:true
        title:qsTr("ping ip: "  ) + ip
        Text{
            id:display
            text:qsTr("loading")
            font.pixelSize: 5
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
        footer:DialogButtonBox{

            TextButton{
                text:qsTr("close")
                onClicked: pingResultDisplay.close()
            }
        }

        Connections{
            target:pingModel
            function onPingExecutionEnded(){
                display.text=pingModel.getPingResult()
                pingResultDisplay.open()
            }

        }
        function openWith(ip){
            pingResultDisplay.ip=ip
            pingModel.startPing(ip);
        }
    }
    function sanityCheck(a){
        var b=a.split(".").map((f)=>{return parseInt(f)}).filter((z)=>{return z>=0 && z<256 } )
        if(b.length===4){return b}
        return null
    }




}
