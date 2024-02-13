import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.10
import QtQuick.Layouts 1.12

Rectangle{
    
    CustomRect{
        id:colorPicker
        width:0
        height:0
    }
    
    property color primaryColor: colorPicker.defaultColor
    property color secondaryColor:colorPicker.clickedColor
    property color borderColor: "black"
    
    
    id:background
    
    width:500
    height:500
    border.color: background.borderColor
    border.width: height*0.01
    radius:height*0.5
    
    
    
    
    
    Rectangle{
        id: maskCenter
        anchors.centerIn: background
        height:background.height-2*background.border.width
        width:background.width-2*background.border.width
        layer.enabled: true
        layer.effect: OpacityMask {
            maskSource: Item {
                width: background.width
                height: background.height
                Rectangle {
                    anchors.centerIn: parent
                    width: background.adapt ? background.width : Math.min(background.width, background.height)
                    height: background.adapt ? background.height : width
                    radius: background.radius
                }
            }
            
            
            
        }
        Rectangle{
            color: screenModel.brightness >=25? background.secondaryColor: background.primaryColor
            width:background.width/2
            height:background.height/2
            
            
            anchors.bottom: parent.verticalCenter
            anchors.left:parent.horizontalCenter
            MouseArea{
                anchors.fill:parent
                onClicked: screenModel.setBrightness(25)
            }
            Text{
                anchors.centerIn: parent
                color:background.borderColor
                text:"25"
                font.pixelSize: background.height/10
            }
            
        }
        Rectangle{
            color: screenModel.brightness>=50? background.secondaryColor: background.primaryColor
            width:background.width/2
            height:background.height/2
            
            anchors.top: parent.verticalCenter
            anchors.left:parent.horizontalCenter
            MouseArea{
                anchors.fill:parent
                onClicked: screenModel.setBrightness(50)
            }
            Text{
                anchors.centerIn: parent
                color:background.borderColor
                text:"50"
                font.pixelSize: background.height/10
            }
        }
        Rectangle{
            color: screenModel.brightness>=75? background.secondaryColor: background.primaryColor
            width:background.width/2
            height:background.height/2
            
            anchors.top: parent.verticalCenter
            anchors.right:parent.horizontalCenter
            MouseArea{
                anchors.fill:parent
                onClicked: screenModel.setBrightness(75)
            }
            Text{
                anchors.centerIn: parent
                color:background.borderColor
                text:"75"
                font.pixelSize: background.height/10
            }
            
        }
        Rectangle{
            color: screenModel.brightness>=100? background.secondaryColor: background.primaryColor
            width:background.width/2
            height:background.height/2
            anchors.bottom: parent.verticalCenter
            anchors.right:parent.horizontalCenter
            
            MouseArea{
                anchors.fill:parent
                onClicked: screenModel.setBrightness(100)
            }
            Text{
                anchors.centerIn: parent
                color:background.borderColor
                text:"100"
                font.pixelSize: background.height/10
            }
        }
        
    }
    
    
    Rectangle{
        
        anchors.centerIn: background
        height:3
        width:background.width
        color:background.borderColor
    }
    Rectangle{
        anchors.centerIn: background
        
        height:background.height
        width:3
        color:background.borderColor
    }
    
    Rectangle{
        anchors.centerIn: parent
        border.color: "black"
        border.width: background.border.width/2
        radius: height*0.5
        height: background.height*0.25
        width:height
        Image{
            source: "qrc:/icons/plcBright.png"
            anchors.centerIn: parent
            anchors.fill:parent
            anchors.margins: parent.height*0.1
        }

    }
    
}
