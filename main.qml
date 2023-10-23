import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.Layouts 1.12
import "virtualKeyboards/"
ApplicationWindow {
    id: window
    visible: true
    width: 805
    height: 485
    title: qsTr("Tabs")
    Rectangle{
        anchors.fill: parent
        color:"blue"
        MainScreen{
            anchors.topMargin: 5
            anchors.fill:parent
        }
    }
    KeyboardInput{
        id: kKEYBOARDUNIT
        state:"closed numbers"
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
}
