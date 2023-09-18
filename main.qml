import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Tabs")

    HeaderBar {
        id:header
        anchors.left: parent.left
        anchors.right: parent.right
    }
    Item{
        id:mainWidget
        anchors.top:header.bottom
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.bottom: parent.bottom

    }


    MainMenuTiles {
        anchors.fill: mainWidget
    }


}
