import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle{
    id:root
    property color backgroundColor: "grey"//"#537fc2" //"#D9D9D9" //
    property color clickedColor: Qt.darker(defaultColor)
    property color borderColor:"black"
    border.width:2
    border.color: borderColor
    color: defaultColor
    radius: 10
}
