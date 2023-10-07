import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Tabs")

    MainScreen{
        anchors.fill:parent
    }

//    HeaderBar {
//        id:header
//        anchors.left: parent.left
//        anchors.right: parent.right
//        onCenterClicked: mainScreen.state="mainMenu"

//    }
//    FileExportScreen {
//        id: root
//    }


    Binding {
        target: VirtualKeyboardSettings
        property: "fullScreenMode"
        value:true
    }

}
