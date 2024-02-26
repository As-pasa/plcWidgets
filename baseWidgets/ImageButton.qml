import QtQuick 2.12
import QtQuick.Controls 2.5

//Item{

//    signal clicked();
//    property alias pressed:mouseArea.pressed
//    property color mainColor: "white"
//    property color pressedColor: "grey"
//    property color borderColor: "black"
//    property int imageMargins:15
//    property string imageSource: "qrc:/icons/plcInfo.png"
//    id:root
//    height:140
//    width:500
//    CustomRect{
//        id:back
//        anchors.fill:parent
//        color: mouseArea.containsPress ? back.clickedColor:back.buttonColor
//    }
//    Image{
//        anchors.margins: root.imageMargins
//        fillMode: Image.PreserveAspectFit
//        source:root.imageSource
//        width:10
//        anchors.fill: parent
//    }
//    MouseArea{
//        id: mouseArea
//        anchors.fill:parent
//        onPressed: {root.clicked();}
//    }
//}
CustomRect{
    id:root
    property string imageSource: "qrc:/icons/plcInfo.png"
    signal clicked();
    MouseArea{
        anchors.fill: parent
        onPressed:root.clicked()
    }
    Image{
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source:root.imageSource

    }
}
