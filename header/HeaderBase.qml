import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../widgets"
BaseRect{
    id:root
    height:60
    property int normalHeight
    property string text: screenView.ShortScreenName
    property alias backBtn:backBtn

    RowLayout{
        spacing: 5
        anchors{
            leftMargin: 15
            margins: 5
            fill: parent
        }
        
        BaseText{
            text:root.text
            fontSize:fontBig
            
            Layout.fillHeight: true
            Layout.fillWidth: true
            
        }
        Item{
            Layout.fillWidth: true
            Layout.fillHeight: true
            
            RowLayout{
                anchors.fill: parent
                TextBtn{
                    id:retranslateBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text:"tr"
                    onClicked: devInfo.retranslate();
                }
                TextBtn{
                    id:backBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text:"bck"
                    onClicked: screenController.prevScreen()
                }
                TextBtn{
                    id:exitBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    text:"ext"
                    onClicked: devInfo.close()
                }       
            }
        }
    }
    
}
