import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../widgets"
BaseRect{
    id:root
    height:100
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
                ImageBtn{
                    id:retranslateBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    //text:"tr"
                    imageSource: "qrc:/icons2/Files_02.png"
                    onClicked: devInfo.retranslate();
                }
                ImageBtn{
                    id:backBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    //text:"bck"
                    imageSource: "qrc:/icons2/Files_02.png"
                    onClicked: screenController.prevScreen()
                }
                ImageBtn{
                    id:exitBtn
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    //text:"ext"
                    imageSource: "qrc:/icons2/Files_02.png"
                    onClicked: devInfo.close()
                }       
            }
        }
    }
    
}
