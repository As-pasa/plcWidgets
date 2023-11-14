import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Item{
    RowLayout{
        anchors.fill: parent
        anchors.margins: 5
        CustomRect{
            id:leftBar
            radius:25
            Layout.fillHeight: true
            Layout.fillWidth: true
            Text{
                id:btext
                text:qsTr("set device brightness")
                horizontalAlignment: Qt.AlignHCenter
                anchors{
                    margins: 5
                    top:parent.top
                    left:parent.left
                    right:parent.right

                }
            }

            BrightnessPicker{
                id:brightnessPicker
                anchors{
                    margins:15
                    bottom:parent.bottom
                    top:btext.bottom
                    horizontalCenter: parent.horizontalCenter

                }
                onValueChanged: {screenModel.brightness=value}
                width:height
                Component.onCompleted: {
                    value=screenModel.brightness
                }

            }

        }
        CustomRect{
            radius:25
            Layout.fillHeight: true
            Layout.fillWidth: true
            TextButton{
                text:qsTr("calibrate screen")
                anchors{
                    margins: 10
                    top:parent.top
                    right:parent.right
                    bottom:parent.bottom
                    left:parent.left
                }
                onClicked: screenModel.calibrate();
            }


        }
    }



        

        
        
        
    }

