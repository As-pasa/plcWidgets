import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12

CustomRect{
    id:root
    width:100
    height:100
    property int value: 05
    property string signatureText:"change day"
    color:Qt.darker(defaultColor)
    TextInput{

        anchors.centerIn: parent
        id:dayChange
        text:value
        onEditingFinished: {
            root.value=parseInt(text)

        }
        inputMethodHints: Qt.ImhDigitsOnly

    }
    Text{
        id:signature
        height:30
        anchors.top:root.top
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.margins: 5
        text:root.signatureText
        horizontalAlignment: Text.AlignHCenter
    }


}
