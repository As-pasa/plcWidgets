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
        width:800
        height:70
        RowLayout{
            anchors.fill: parent
            spacing: 20
            ImageButton{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
            }
            ImageButton{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
            }
            ImageButton{
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.margins: 5
            }
        }
    }

}
