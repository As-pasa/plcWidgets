import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4

Item{
    height:500
    width:300
    id:root
    signal clicked()
    property string imageSource: "qrc:/plkLanguage.png"
    property string text: "hello"
    ImageButton{
        id:centralImage
        height:root.height*0.8
        anchors.left:parent.left
        anchors.right:parent.right
        anchors.top:parent.top
        imageSource: root.imageSource
        onClicked: {root.clicked();}
    }
    Text{
        anchors.margins: 5
        id:footText
        anchors.top:centralImage.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        font.pixelSize: 30
        text:root.text
        wrapMode: Text.WordWrap
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignHCenter
    }
}
