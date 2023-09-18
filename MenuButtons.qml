import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
CustomRect{
    width:800
    height:70
    property int imageMargins: 5
    id:root
    RowLayout{

        anchors.fill: parent
        spacing: 30

        ImageButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            Layout.margins: 5
            imageMargins: root.imageMargins
        }
        ImageButton{

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.alignment: Qt.AlignCenter
            imageMargins: root.imageMargins
        }
        ImageButton{
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 5
            Layout.alignment: Qt.AlignRight
            imageMargins: root.imageMargins
        }
    }
}
