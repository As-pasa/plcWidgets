import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Button{
    property color mainColor: "white"
    property color pressedColor: "grey"
    property color borderColor: "black"
    text: "hello"
    id:root
    width:500
    height:140
    font.pixelSize: 20
    background: CustomRect {
        color: root.down? root.pressedColor:root.mainColor
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
