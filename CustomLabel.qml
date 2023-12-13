import QtQuick 2.12
import QtQuick.Controls 2.5

Label{
    CustomRect{
        id:colorPicker
    }
    property int fontSize: 10
    property color bb:colorPicker.defaultColor
    background: CustomRect{
        color:bb
        border.width: 0
    }

    text: "hello"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: fontSize
    color: "black"
}
