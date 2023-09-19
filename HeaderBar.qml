import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
Item{
    id:root
    height:65
    signal leftClicked()
    signal centerClicked()
    signal rightClicked()
    property string text: "version 1.3"
    RowLayout{
        anchors{
            leftMargin: 15
            rightMargin: 15
            topMargin: 5
            fill: parent
        }

        CustomLabel{
            text:root.text
            fontSize:16
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            Layout.alignment: Qt.AlignLeft
        }
        MenuButtons {
            Layout.alignment: Qt.AlignRight
            Layout.fillHeight: true
            Layout.preferredWidth: 400
            onLeftClicked: root.leftClicked()
            onCenterClicked: root.centerClicked()
            onRightClicked: root.rightClicked()
        }
    }
}
