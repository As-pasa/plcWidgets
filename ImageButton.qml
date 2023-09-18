import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Button{
    property color mainColor: "white"
    property color pressedColor: "grey"
    property color borderColor: "black"
    id:root
    height:140
    width:500
    property string imageSource: "qrc:/plkLanguage.png"
    background: CustomRect{
        color: root.down? root.pressedColor:root.mainColor
    }
    contentItem: Image{
        source:root.imageSource
        fillMode: Image.PreserveAspectFit
    }
}
