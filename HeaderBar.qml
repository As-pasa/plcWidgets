import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
Item{
    height:65
    RowLayout{
        anchors.leftMargin: 15
        anchors.rightMargin: 15
        anchors.topMargin: 5
        anchors.fill: parent
        CustomLabel{
            text:"version 1.3"
            fontSize:16
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            Layout.alignment: Qt.AlignLeft
        }
        MenuButtons {
            Layout.alignment: Qt.AlignRight
            Layout.fillHeight: true
            Layout.preferredWidth: 400
        }
    }
}
