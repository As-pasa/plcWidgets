import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle{
    property color defaultColor: "#537fc2" //"#D9D9D9" //
    property color clickedColor: Qt.darker(defaultColor)
    property color buttonColor:  "#518e8f"
    border.width:2
    border.color: "black"
    color: defaultColor
    radius: Math.min(height,width)*0.3
}
