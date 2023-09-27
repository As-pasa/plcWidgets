import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Label{
    property int fontSize: 20

    background: CustomRect{}
    bottomInset: -5
    topInset: -5
    leftInset: -5
    rightInset: -5
    text: "hello"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: fontSize
}
