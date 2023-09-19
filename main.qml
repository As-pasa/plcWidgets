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
        onCenterClicked: mainScreen.state="mainMenu"

    }
    Item{
        id:mainWidget
        anchors{
            top:header.bottom
            left:parent.left
            right:parent.right
            bottom: parent.bottom
        }
        CustomRect{
            id: timeWidget
            anchors{
                top:parent.top
                bottom:parent.bottom
                left:parent.left
                margins:15
            }
            radius:30
            width:parent.width*0.55
        }
        CustomRect{
            id: timeZoneWidget
            radius:30
            anchors{
                top:parent.top
                bottom:parent.bottom
                right:parent.right
                left:timeWidget.right
                margins:15


            }


        }
    }


}
