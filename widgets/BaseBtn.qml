import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3
BaseRect{
    id:btn
    property alias morea:clicker
    property color normalColor: "#44659e"//"#35359c"//"#021030"
    property color clickColor:Qt.lighter(normalColor)
    signal clicked()
    Layout.fillHeight: true
    Layout.fillWidth: true
    color:clicker.containsPress?  clickColor:normalColor
    MouseArea{
        anchors.fill: parent
        id:clicker
        onClicked: btn.clicked()
    }
}
