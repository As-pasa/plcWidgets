import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.Layouts 1.12

Item{
    RowLayout{
        anchors.fill: parent
        anchors.margins: 5

            CustomRect{
                radius: 20
                id:deviceInfo
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout{
                    anchors.margins: 5
                    anchors.fill:parent
                    SignedLabel{
                        //: dev info screen
                        underLabel:qsTr("device name")
                        textHeight:20
                        text:devInfo.deviceName
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        makeBorders: false
                    }
                    SignedLabel{
                        //: dev info screen
                        underLabel:qsTr("device type")
                        textHeight:20
                        text:devInfo.deviceType
                        Layout.fillWidth: true
                                                Layout.fillHeight: true
                        makeBorders: false
                    }
                    SignedLabel{
                        underLabel:qsTr("firmware")
                        textHeight:20
                        text:devInfo.firmWare
                        Layout.fillWidth: true
                                                Layout.fillHeight: true
                        makeBorders: false
                    }
                    SignedLabel{
                        underLabel:qsTr("firmware Update Date")
                        textHeight:20
                                                Layout.fillHeight: true
                        text:devInfo.firmWareDate
                        Layout.fillWidth: true
                        makeBorders: false
                    }
                }
            }
            CustomRect{
                id:passwordInfo
                radius: 20
                Layout.fillHeight: true
                Layout.fillWidth: true

                ColumnLayout{
                    anchors.fill: parent
                    anchors.margins: 5
                    TimeEditLine{
                        id: passwordInput
                        signatureText:qsTr("enter new password")
                        value: "54321"
                        Layout.fillWidth: true

                    }
                    TextButton{
                        text:qsTr("set as password")
                        Layout.fillWidth: true
                        onClicked: {
                            passwordModel.setPassword(passwordInput.value)
                        }
                    }
                }
            }
        }
    }





