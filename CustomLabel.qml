import QtQuick 2.12
import QtQuick.Controls 2.5

Label{
    property int fontSize: 10

    background: CustomRect{
        border.width: 0
    }

    text: "hello"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    font.pixelSize: fontSize
    color: "black"
}
