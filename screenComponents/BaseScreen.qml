import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0


import "../widgets"
import "../header"


Item{
    id:root
    property alias main:mainWidget
    HeaderState {
        id: headerState
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5
        state: barModel.BarState

    }
    Loader{

        id:mainWidget
        anchors{
            margins:5
            top:headerState.bottom
            left:parent.left
            right:parent.right
            bottom:parent.bottom
        }
    }
}
