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

    Dialog{
        id:enKeyBoard
        anchors.centerIn: parent
        width: parent.width
        height:parent.height
        property bool shiftPressed:false
        GridLayout{
            anchors.fill: parent
            columns:14
            Repeater{
                model:'`@@~ 1@@! 2@@@ 3@@# 4@@$ 5 6@@^ 7@@& 8@@* 9@@( 0@@) -@@_ =@@+ backspace q w e r t y u i o p [@@{ ]@@} \\@@| a s d f g h j k l ;@@: \'@@\" enter shift z x c v b n m ,@@< .@@> /@@? shift space'.split(" ")
                CustomRect{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    radius: 15
                    border.width:1
                    Text{
                        anchors.centerIn: parent
                        text:modelData.split("@@")[0]
                    }
                    Text{
                        anchors.top:parent.top
                        anchors.right:parent.right
                        text:modelData.split("@@")[1]
                    }

                }
            }

        }

    }
    Component.onCompleted: enKeyBoard.open()

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
