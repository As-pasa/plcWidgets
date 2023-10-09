import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Rectangle{
    property color defaultColor: "#D9D9D9" //"#537fc2"
    property color clickedColor: Qt.darker(defaultColor)
    property color buttonColor: "#519e8f"
    border.width:2
    border.color: "black"
    color: defaultColor
    radius: Math.min(height,width)*0.3
}
