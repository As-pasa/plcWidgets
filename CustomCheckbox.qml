import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Item {
    id: control
    width:checkText.width+indicator.width+indicator.anchors.margins*2+checkText.anchors.margins*2
    property bool toggled:false
    property int fontSize:20
    property string text: "checkbox"
    CustomRect{
        id: indicator
        width: height
        anchors{
            top:control.top
            bottom:control.bottom
            left:control.left
            margins:2
        }


        CustomRect{
            opacity: control.toggled? 1 :0
            id:innerIndicator
            color:"black"
            anchors{
                centerIn:indicator
                fill:indicator
                margins: 5
            }

        }
    }
    Text{
        id:checkText
        anchors{
            left:indicator.right
            top:control.top
            bottom:control.bottom
            margins:10
        }
        font.pixelSize: control.fontSize
        text:control.text
        verticalAlignment: Text.AlignVCenter

    }
    MouseArea{
        id:clickArea
        anchors{
            fill: parent
        }
        onClicked: {
            control.toggled= control.toggled === true? false:true
        }
    }
    
}
