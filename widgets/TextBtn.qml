import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
BaseBtn{
    id:textBtn
    property string text:"click"
    property int fontBig:wrapped.fontBig
    property int fontSmall:wrapped.fontSmall
    property int fontSize: fontBig
    BaseText{
        id:wrapped
        fontSize: textBtn.fontSize
        anchors.fill: parent
        text:textBtn.text
    }
    

}
