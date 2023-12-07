import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Item{
   id:root
    property string underLabel: "mm"
    property bool makeBorders:true
    property string text:"foo"
    property int textHeight:30
    Text{
        anchors{
            top:parent.top
            horizontalCenter: parent.horizontalCenter

        }

        horizontalAlignment: Text.AlignHCenter
        height:textHeight
        width:parent.width*0.8
        id:upperLabel
        text:root.underLabel
    }
    CustomLabel{
        anchors{
            top:upperLabel.bottom

            bottom:parent.bottom
            left:parent.left
            right:parent.right

        }
        id:mainText
        text:root.text
    }

}
