import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ScreenService 1.0
import HeaderService 1.0
CustomRect{
    id:root
    height:60
    property int normalHeight
    property string text: screenView.ShortScreenName
    state:barModel.BarState
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
            id:backBtn
            Layout.preferredWidth: 50
            Layout.fillHeight: true
            imageSource: "qrc:/icons/plcHome.png"
            onClicked: {
                screenController.prevScreen()
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

    states:[
        State{
            name:"normal"
            PropertyChanges{
                target:root
                y:normalHeight
                opacity:100
            }
        },
        State{
            name:barModel.getStateName(Header.Closed)
            PropertyChanges {
                target: root
                y:normalHeight-(root.height/2)
                opacity:0
            }
        },
        State{
            name:barModel.getStateName(Header.Opened)
            extend:"normal"
            PropertyChanges{
                target:backBtn
                onClicked:{
                    screenController.prevScreen()
                }
            }

        },
        State{
            name:barModel.getStateName(Header.Password)
            extend:"normal"
            PropertyChanges{
                target:backBtn
                onClicked:{
                    screenController.showInfoWithText("hehehe")
                }
            }
        }

    ]
    Component.onCompleted: normalHeight=root.y
}
