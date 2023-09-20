import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
CustomLabel{
    id:root
    x:parent.width/2-width/2
    property string underLabel: "mm"
    property bool underLabelUp: false
    Text{
        anchors{
            top: underLabelUp? undefined:parent.bottom
            left:parent.left
            right:parent.right
            bottom: underLabelUp? parent.top:undefined
        }
        text:underLabel
        horizontalAlignment: Text.AlignHCenter
    }
    
}
