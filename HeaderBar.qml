import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ScreenService 1.0
CustomRect{
    id:root
    property int blockSemaphore:0
    height:60
    property string text: screenView.ShortScreenName // qsTr("version 1.3")
    RowLayout{
        spacing: 5
        anchors{
            leftMargin: 15
            margins: 5
            fill: parent
        }

        CustomLabel{
            text:root.text
            fontSize:14

            Layout.fillHeight: true
            Layout.preferredWidth: 130

        }
        CustomLabel{
            text:qsTr("Blocked")
            fontSize: 16
            Layout.fillHeight: true
            Layout.preferredWidth: 2
            enabled:blockSemaphore>0
            opacity: blockSemaphore>0? 1:0
        }
        Item{
            Layout.fillWidth: true
        }

        ImageButton{
            Layout.preferredWidth: 50
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcLang.png"
            onClicked: {
                devInfo.retranslate();
            }
        }
        ImageButton{

            Layout.preferredWidth: 50
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcHome.png"
            onClicked: {
                screenView.switchToPreviousScreen()
            }
        }
        ImageButton{
            Layout.preferredWidth: 50
            Layout.fillHeight: true



            imageSource: "qrc:/icons/plcExit.png"
            onClicked: {
                devInfo.close()
            }
        }
    }
}
