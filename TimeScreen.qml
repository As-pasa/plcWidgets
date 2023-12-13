import QtQuick 2.12
import QtQuick.Controls 2.5
import "virtualKeyboards"
import QtQuick.Layouts 1.12
Item{
    signal leftClicked()
    signal rightClicked()

    RowLayout{
        anchors.fill: parent
        anchors.margins: 5
        MenuTile{
            text:qsTr("date/time")

            imageSource: "qrc:/icons/plcTime.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: leftClicked()
        }
        MenuTile{
            text:qsTr("timeZone")
            imageSource: "qrc:/icons/plcTime.png"
            Layout.fillHeight: true
            Layout.fillWidth: true
            onClicked: rightClicked()
        }
    }

}
