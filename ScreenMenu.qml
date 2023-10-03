import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
Item{

    CustomRect{
        anchors.fill: parent
        anchors.margins: 15
        radius: 30
        
        
        CustomRect{
            id:leftBar
            radius:25
            anchors{
                margins: 10
                top:parent.top
                left:parent.left
                bottom:parent.bottom
                right:parent.horizontalCenter
            }
            Text{
                id:btext
                text:"set device brightness"
                horizontalAlignment: Qt.AlignHCenter
                anchors{
                    margins: 10
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
            anchors{
                margins: 10
                top:parent.top
                bottom:parent.bottom
                left:leftBar.right
                right:parent.right
            }
            TextButton{
                text:"calibrate screen"
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