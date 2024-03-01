import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
BaseBtn{
    id:textBtn
    property string text:"click"
    BaseText{
        fontSize: fontBig
        anchors.fill: parent
        text:textBtn.text
    }
    

}
