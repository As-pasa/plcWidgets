import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
Item{
    id:mainWidget
    anchors{
        fill:parent
    }
    TimeWidgets {
        id: timeWidget
        anchors{
            top:parent.top
            bottom:parent.bottom
            left:parent.left
            margins:15
        }
        radius:30
    }
    CustomRect{
        id: timeZoneWidget
        property string selectedTZ: timeModel.currentTimeZone
        radius:30
        
        anchors{
            top:parent.top
            bottom:parent.bottom
            right:parent.right
            left:timeWidget.right
            margins:15
        }
        Loader{
            id:tzPageHolder
            anchors.fill: parent
            sourceComponent: tzDisplay
        }
        
        
        Component{
            id: tzDisplay
            Item{
                CustomLabel{
                    id:tzHeader
                    text:"time zone settings"
                    anchors{
                        margins:15
                        top:parent.top
                        horizontalCenter: parent.horizontalCenter
                    }
                    
                }
                
                CustomLabel{
                    id:selectLabel
                    
                    text:timeZoneWidget.selectedTZ
                    
                    anchors{
                        margins: 15
                        top:tzHeader.bottom
                        left:parent.left
                        right:parent.right
                        
                    }
                }
                TextButton{
                    id:editBtn
                    text:"edit"
                    enabled: aTZCheckbox.toggled? false : true
                    anchors{
                        margins: 15
                        top:selectLabel.bottom
                        left:parent.left
                        right:parent.right
                    }
                    onClicked: {
                        tzPageHolder.sourceComponent=timeZoneEdit
                    }
                }
                CustomCheckbox{
                    id:aTZCheckbox
                    text:"use ATZ"
                    height:40
                    anchors{
                        margins: 15
                        top:editBtn.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                
                
            }
            
        }
        Component{
            id:timeZoneEdit
            Item{
                
                PageSelector {
                    id: pgSelector
                    property string initialValue:""
                    source:Array.from(timeModel.timeZones)
                    selectedContent: timeModel.currentTimeZone
                    anchors{
                        top:parent.top
                        left:parent.left
                        right:parent.right
                        bottom:selectionDisplay.top
                        margins: 10
                    }
                    onSelectedContentChanged: {
                        timeModel.currentTimeZone=pgSelector.selectedContent
                    }
                    Component.onCompleted: {
                        
                        
                        initialValue=timeModel.currentTimeZone
                    }
                }
                
                CustomLabel{
                    id:selectionDisplay
                    text: pgSelector.selectedContent
                    horizontalAlignment: Text.AlignHCenter
                    anchors{
                        margins:10
                        bottom:submitTZBTN.top
                        horizontalCenter: parent.horizontalCenter
                    }
                }
                TextButton{
                    id:submitTZBTN
                    text:"submit selected"
                    anchors{
                        margins:10
                        bottom: discardTZChange.top
                        horizontalCenter: parent.horizontalCenter
                    }
                    onClicked: {
                        timeModel.installCurrentTimeZoneAsSystem()
                        tzPageHolder.sourceComponent=tzDisplay
                        
                    }
                }
                TextButton{
                    id:discardTZChange
                    text:"cancel"
                    anchors{
                        margins:10
                        bottom: parent.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                    onClicked:{
                        timeModel.currentTimeZone=pgSelector.initialValue
                        tzPageHolder.sourceComponent=tzDisplay
                    }
                }
            }
            
            
            
        }
        
        
    }
    
}
