import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import "baseWidgets"
import "virtualKeyboards/"
ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 243
    title: qsTr("Tabs")

//    Rectangle{
//        id:applicationScreen
//        anchors.fill: parent
//        color: "grey"
//        Loader{
//            id:appScreenLoader
//            anchors.fill: parent

//        }


//        MainScreen{
//            id:appScreen
//            anchors.topMargin: 1
//            anchors.fill:parent
//            state:screenView.CurrenScreen
//        }

//    }

//    KeyboardInput{
//        id: kKEYBOARDUNIT
//        state:"ipInput"
//    }
    CustomRect{
        anchors.fill: parent
    }


}
