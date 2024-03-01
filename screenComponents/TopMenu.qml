import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0


import "../widgets"
import "../header"
import "../screenComponents"


Item{
    property alias lft:left
    property alias mid:middle
    property alias rgt:right
    RowLayout{
        anchors.fill:parent
        MenuBtn{
            id:left
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        MenuBtn{
            id:middle
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        MenuBtn{
            id:right
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
