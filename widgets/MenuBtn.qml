import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0







BaseBtn{
    id:root
    property string text:"info"
    property string source:"qrc:/icons/plcInfo.png"
    ColumnLayout{
        anchors.margins: 2
        anchors.fill: parent
        id:lay
        Image{
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins:10
            fillMode: Image.PreserveAspectFit
            source:root.source
        }
        BaseText{
            Layout.preferredHeight: 30
            Layout.fillHeight: true
            Layout.fillWidth: true
            fontSize: fontBig
            text:root.text   
        }
    }
    
}
