import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Button{
    property color mainColor: "white"
    property color pressedColor: "grey"
    property color borderColor: "black"
    text: "hello"
    id:root


    font.pixelSize: 20
    background: CustomRect {
        id:back
        color: root.down? back.clickedColor: back.buttonColor
    }
    contentItem: Text{
        text:root.text
        font:root.font
        opacity:enabled?1.0:0.3
        color: root.borderColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
