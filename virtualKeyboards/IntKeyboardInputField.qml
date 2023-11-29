import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ".."
Item{
    id:root
    implicitHeight: 100
    implicitWidth: 100
    property string value: "123"
    property string signature:qsTr("int name")
    property var keyboardUnit:kKEYBOARDUNIT
    property string keyboardType:"closed numbers"
    signal enterPressed()
    ColumnLayout{
        anchors.fill: parent
        CustomLabel{
            Layout.fillHeight: true
            Layout.fillWidth: true
            text:root.signature
        }
        CustomLabel{
            Layout.fillWidth: true
            Layout.fillHeight: true
            text:root.value
        }
        TextButton{
            text:qsTr("edit")
            Layout.fillWidth: true
            Layout.fillHeight: true
            onClicked: {
                root.keyboardUnit.state="closed numbers"
                root.keyboardUnit.client=parent.parent
                root.keyboardUnit.data=root.value
                root.keyboardUnit.open()

            }
        }
    }
}
