import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
Item{
    
    CustomLabel{
        id:display
        text:"11"
        height:50
        width:100
        anchors.right:parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
    Text{
        id:signature
        anchors{
            bottom:display.top
            left:display.left
            right:display.right
        }
        text:"hour"
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }
    TextButton{
        id:editter
        height:50
        anchors{
            top:display.bottom
            left:display.left
            right:display.right
        }
        
        text:"edit"
        
    }
    
    
}
