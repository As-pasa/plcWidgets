import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "virtualKeyboards/"
Item{
    property string signatureText:"change day"
    property alias value: foo.value
    implicitHeight: 100
    implicitWidth: 100
    IntKeyboardInputField{
        id:foo
        anchors.fill: parent
        signature:parent.signatureText

    }
}
