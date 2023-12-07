import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
import "QmlKeyboard"
ApplicationWindow {
    id: window
    visible: true
    width: 805
    height: 485
    title: qsTr("Tabs")

    Dialog{
        id:enKeyBoard
        anchors.centerIn: parent
        implicitWidth:  parent.width
        implicitHeight:parent.height
        property bool shiftPressed:false
        ColumnLayout{
            spacing: 1
            anchors.fill: parent
            Text{
                text:"aaaaa"
                horizontalAlignment: Qt.AlignHCenter
                Layout.minimumHeight: parent.height/8*2
                Layout.fillWidth: true
                verticalAlignment: Qt.AlignVCenter
            }
            KeyRow {
                Layout.minimumHeight: parent.height/8

                Layout.fillWidth: true
                model:'`@@~ 1@@! 2@@@ 3@@# 4@@$ 5 6@@^ 7@@& 8@@* 9@@( 0@@) -@@_ =@@+ backspace'.split(" ")
            }
            KeyRow {
                Layout.minimumHeight: parent.height/8

                Layout.fillWidth: true

                model:'q w e r t y u i o p [@@{ ]@@} \\@@| close'.split(" ")
            }

            KeyRow {
                Layout.minimumHeight: parent.height/8

                Layout.fillWidth: true
                model:'a s d f g h j k l ;@@: \'@@\" enter'.split(" ")
            }

            KeyRow {
                Layout.minimumHeight: parent.height/8

                Layout.fillWidth: true

                model:'z x c v b n m ,@@< .@@> /@@? shift'.split(" ")
            }

            KeyRow {
                Layout.minimumHeight: parent.height/8

                Layout.fillWidth: true

                model:'space'.split(" ")
            }
        }




    }
    Dialog{
        id:test
        implicitWidth: parent.width
        implicitHeight: parent.height
        GridLayout{
            anchors.fill: parent
            columns:3

            Repeater{
                model:8
                CustomRect{
                    Text{
                        text:index
                    }
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.columnSpan: {
                        if(index===3){
                            return 2
                        }
                        return 1
                    }
                }

            }
        }

    }
    Component.onCompleted: test.open()
    //Component.onCompleted: enKeyBoard.open()

    //    Rectangle{
//        anchors.fill: parent
//        color:"grey"
//        MainScreen{
//            anchors.topMargin: 5
//            anchors.fill:parent
//        }
//    }



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
