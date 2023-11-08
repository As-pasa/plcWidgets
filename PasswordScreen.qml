import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    id:passwordScreen
    signal openGates()
    ColumnLayout{
        anchors.margins: 20
        spacing: 20
        anchors.fill: parent
        CustomLabel{
            Layout.fillHeight: true
            Layout.fillWidth: true
            text:qsTr("PLC configurator")
        }
        IntKeyboardInputField{
            id:passwordinput
            Layout.alignment: Qt.AlignCenter
            Layout.preferredWidth: parent.width*0.7
            signature:qsTr("Enter the password to enter the system")
            Layout.fillHeight: true
            //Layout.fillWidth: true
        }
        TextButton{

            //: password acceptance
            text:qsTr("Accept")
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: {
                if(passwordModel.checkPassword(passwordinput.value) ){
                    passwordScreen.openGates()
                }
            }
        }
        Item{
            Layout.minimumHeight: 70

            Layout.fillWidth: true
            RowLayout{
                anchors.fill: parent
                ImageButton{
                    Layout.alignment: Qt.AlignLeft
                    Layout.minimumWidth: 70
                    Layout.maximumWidth: 70
                    Layout.fillHeight: true
                    imageSource: "qrc:/icons/plcLang.png"
                    onClicked: {
                        devInfo.retranslate();
                    }
                }
                TextButton{
                    Layout.alignment: Qt.AlignCenter
                    Layout.minimumWidth: 150
                    Layout.fillHeight: true
                    text:qsTr("password recovery")
                    onClicked: {
                        contactDialog.open()
                    }
                }
                ImageButton{
                    Layout.alignment: Qt.AlignRight
                    Layout.minimumWidth: 70
                    Layout.fillHeight: true
                    Layout.maximumWidth: 70
                    imageSource: "qrc:/icons/plcExit.png"
                    onClicked: {
                        devInfo.close();
                    }
                }
            }
        }
    }
    Dialog{
        property string ip:"0.0.0.0"

        id:contactDialog
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        modal:true
        //: recovery screen
        title: qsTr("Password recovery")
        Item{
            ColumnLayout{
                Text{
                    //: password recovery screen
                    text:qsTr("To recover your password,\nplease contact one of the addresses provided.")
                }
                Repeater{
                    model:(passwordModel!==null)? passwordModel.contacts: ['Foo']
                    CustomLabel{
                        text:modelData
                    }
                }
            }

        }
        footer:DialogButtonBox{

            TextButton{
                //: recovery dialog
                text:qsTr("close")
                onClicked: contactDialog.close()
            }
        }

    }


}
