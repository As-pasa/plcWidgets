import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Label{
    property int fontSize: 20
    height:140
    width:500
    background: CustomRect{}
    text: "hello"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: fontSize
}
