import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
Item{
    id:root

    property int fontSmall:12
    property int fontBig:20
    property string text:"hello"
    property color color:"white"
    property int fontSize:fontSmall
    Text{
        anchors.fill: parent
        color:root.color
        font.pixelSize: root.fontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text:root.text
        
    }
}
