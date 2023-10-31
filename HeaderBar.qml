import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
CustomRect{
    id:root
    property int blockSemaphore:0
    height:65
    signal leftClicked()
    signal centerClicked()
    signal rightClicked()
    property string text: "version 1.3"
    RowLayout{
        spacing: 5
        anchors{
            leftMargin: 15
            rightMargin: 5
            margins: 5
            fill: parent
        }

        CustomLabel{
            text:root.text
            fontSize:16

            Layout.fillHeight: true
            Layout.preferredWidth: 100

        }
        CustomLabel{
            text:qsTr("Blocked")
            fontSize: 16
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            enabled:blockSemaphore>0
            opacity: blockSemaphore>0? 1:0
        }
        Item{
            Layout.fillWidth: true
        }

        ImageButton{
            Layout.preferredWidth: 100
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcLang.png"
            onClicked: {
                root.leftClicked();
                devInfo.retranslate();
            }
        }
        ImageButton{

            Layout.preferredWidth: 100
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcHome.png"
            onClicked: {
                root.centerClicked();
            }
        }
        ImageButton{
            Layout.preferredWidth: 100
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcExit.png"
            onClicked: {
                root.rightClicked();
                devInfo.close()
            }
        }
    }
}
