import QtQuick 2.12
import QtQuick.Controls 2.5


//Button{
//    property color mainColor: "white"
//    property color pressedColor: "grey"
//    property color borderColor: "white"
//    text: "hello"
//    id:root

//    font.pixelSize: 10
//    background: CustomRect {
//        id:back
//        color: root.down? back.clickedColor: back.buttonColor
//    }
//    contentItem: Text{
//        text:root.text
//        font:root.font
//        opacity:enabled?1.0:0.3
//        color: root.borderColor
//        horizontalAlignment: Text.AlignHCenter
//        verticalAlignment: Text.AlignVCenter
//    }
//}
/*CustomLabel{
    id:root
    signal clicked()
    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()
    }
}*/

Text{
    id:customText
    font.pixelSize:10
    text:"hello"
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
    color:"white"
}
