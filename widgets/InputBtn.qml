import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import KeyboardService 1.0
import "../widgets"
import "../header"
import "../screenComponents"
import "../QmlKeyboard"

Item{
    id:root
    BaseText{id:colorPicker;visible:false; enabled:false}

    property string text:"Hi"
    property int inputScreenState:0
    property bool btnEnabled:true
    property int fontSize:fontBig
    property int fontSmall:colorPicker.fontSmall
    property int fontBig:colorPicker.fontBig
    RowLayout{
        id:foo
        anchors.fill: parent

        BaseText{
            id:mins
            Layout.fillHeight: true
            Layout.fillWidth: true
            text:root.text
            fontSize: root.fontSize
        }

        ImageBtn{
            enabled: root.btnEnabled
            visible: root.btnEnabled
            Layout.fillHeight: true
            Layout.fillWidth: false
            Layout.preferredWidth:foo.height
            imageSource: "qrc:/icons2/BaseSettings_02.png"
            onClicked: {
                screenController.goToScreen(root.inputScreenState)
            }
        }
        
        
    }
}
