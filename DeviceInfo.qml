import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.12

Item{
    CustomRect{
        anchors.fill: parent
        anchors.margins: 15
        radius:30
        CustomRect{
            radius: 20
            id:deviceInfo
            anchors{
                margins: 15
                top:parent.top
                left:parent.left
                bottom:parent.bottom
            }
            width:parent.width*0.5


            ColumnLayout{
                anchors.margins: 15
                anchors.fill:parent
                TimeDisplayLabel{
                    //: dev info screen
                    underLabel:qsTr("device name")
                    underLabelUp:true
                    text:devInfo.deviceName
                    Layout.fillWidth: true
                    makeBorders: false
                }
                TimeDisplayLabel{
                    //: dev info screen
                    underLabel:qsTr("device type")
                    underLabelUp:true
                    text:devInfo.deviceType
                    Layout.fillWidth: true
                    makeBorders: false
                }
                TimeDisplayLabel{
                    underLabel:qsTr("firmware")
                    underLabelUp:true
                    text:devInfo.firmWare
                    Layout.fillWidth: true
                    makeBorders: false
                }
                TimeDisplayLabel{
                    underLabel:qsTr("firmwareVersion")
                    underLabelUp:true
                    text:devInfo.firmWareDate
                    Layout.fillWidth: true
                    makeBorders: false
                }
            }
        }
        CustomRect{
            id:passwordInfo
            radius: 20
            anchors{
                margins: 15
                top:parent.top
                right:parent.right
                left:deviceInfo.right
                bottom:parent.bottom
            }
            ColumnLayout{
                anchors.fill: parent
                anchors.margins: 15
                TimeEditLine{
                    id: passwordInput
                    signatureText:qsTr("enter new password")
                    value: parseInt(devInfo.password)
                    Layout.fillWidth: true

                }
                TextButton{
                    text:qsTr("set as password")
                    Layout.fillWidth: true
                    onClicked: {
                        devInfo.setPassword(passwordInput.value)
                    }
                }
            }
        }
    }
}

