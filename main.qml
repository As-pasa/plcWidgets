import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import "QmlKeyboard"
import "widgets"
import "header"
import "screenComponents"


ApplicationWindow {
    id: window
    visible: true
    width: 400
    height: 243
    title: qsTr("Tabs")
    BaseRect{id:colorPicker}
    color:colorPicker.backgroundColor
    ScreenStates {
        anchors.fill:parent
        state:screenView.CurrenScreen
    }



}
