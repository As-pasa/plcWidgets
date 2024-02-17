import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ScreenService 1.0
import "virtualKeyboards/"
Item{

    id:passwordScreen
    ColumnLayout{
        anchors.margins: 5
        spacing: 5
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
        }
        TextButton{
            text:qsTr("Accept")
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: screenController.submitPassword(passwordinput.value)

        }
    }
}
