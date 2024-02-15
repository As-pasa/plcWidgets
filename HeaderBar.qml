import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ScreenService 1.0
CustomRect{
    id:root
    height:60
    property int normalHeight
    property string text: screenView.ShortScreenName
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
    state:barModel.BarState
    states:[
        State{
            name:"closed"
            PropertyChanges {
                target: root
                y:normalHeight-(root.height/2)
                opacity:0
                enabled:false
            }
        },
        State{
            name:"opened"
            PropertyChanges{
                target:root
                y:normalHeight
                opacity:100
                enabled:true
            }
        }
    ]
    Component.onCompleted: normalHeight=root.y
}
