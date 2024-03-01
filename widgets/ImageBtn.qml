import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
BaseBtn{
    id:imgBtn
    property string imageSource:"qrc:/plcSettings.png"
    property int imageMargins: 10

    Image{
        anchors.margins: imgBtn.imageMargins
        fillMode: Image.PreserveAspectFit
        anchors.fill: parent
        source:imgBtn.imageSource
    }
}
