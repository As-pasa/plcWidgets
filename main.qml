import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 800
    title: qsTr("Tabs")

    CustomRect{
        anchors.left: parent.left
        anchors.right: parent.right
        height:70
        RowLayout{
            anchors.fill: parent
            spacing: 30
            ImageButton{
                Layout.preferredWidth: 150
                Layout.fillHeight: true
                //Layout.fillWidth: true
                Layout.alignment: Qt.AlignLeft
                Layout.margins: 5
            }
            ImageButton{
                Layout.preferredWidth: 150
                Layout.fillHeight: true
                //Layout.fillWidth: true
                Layout.margins: 5
                Layout.alignment: Qt.AlignCenter
            }
            ImageButton{
                Layout.preferredWidth: 150
                Layout.fillHeight: true
                //Layout.fillWidth: true
                Layout.margins: 5
                Layout.alignment: Qt.AlignRight
            }
        }
    }

}
