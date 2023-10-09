import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 805
    height: 485
    title: qsTr("Tabs")
    Rectangle{
        anchors.fill: parent
        color:"grey"
        MainScreen{
            anchors.topMargin: 5
            anchors.fill:parent
        }
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
