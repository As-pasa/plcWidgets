import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
Item{
    id:root
    property bool blocking:tzPageHolder.sourceComponent!=tzDisplay ||timeWidget.editModeOn
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
           
    }
    Component{
        id: tzDisplay
        Item{
            CustomLabel{
                background: CustomRect{
                    border.width: 0
                }
                id:tzHeader
                //: time screen
                text:qsTr("time zone settings")
                anchors{
                    margins:15
                    top:parent.top
                    horizontalCenter: parent.horizontalCenter
                }

            }

            CustomLabel{
                id:currentTimeZoneLabel
                background: CustomRect{
                    border.width: 0
                }
                text:timeModel.currentTimeZone

                anchors{
                    margins: 15
                    top:tzHeader.bottom
                    left:parent.left
                    right:parent.right

                }
            }
            TextButton{
                id:editBtn
                //: time edit btn
                text: qsTr("edit")
                enabled: aTZCheckbox.toggled? false : true
                anchors{
                    margins: 15
                    top:currentTimeZoneLabel.bottom
                    left:parent.left
                    right:parent.right
                }
                onClicked: {

                    tzPageHolder.sourceComponent=timeZoneEdit

                }
            }
            CustomCheckbox{
                id:aTZCheckbox
                text: qsTr("use ATZ")
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
                source:timeModel.timeZones
                property string selectedContent:timeModel.currentTimeZone

                anchors{
                    top:parent.top
                    left:parent.left
                    right:parent.right
                    bottom:selectionDisplay.top
                    margins: 10
                }


                delegate: TextButton{
                    anchors{
                        left:parent.left
                        right:parent.right
                        margins: 5
                    }

                    background: CustomRect{
                        border.width:0
                        color:pgSelector.selectedContent==text?clickedColor: defaultColor
                    }
                    text:modelData
                    onClicked: {
                        pgSelector.selectedContent=text
                    }
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
                text:qsTr("submit selected")
                anchors{
                    margins:10
                    bottom: discardTZChange.top
                    horizontalCenter: parent.horizontalCenter
                }
                onClicked:{
                    timeModel.currentTimeZone=pgSelector.selectedContent
                    timeModel.installCurrentTimeZoneAsSystem()
                    tzPageHolder.sourceComponent=tzDisplay
                }

            }
            TextButton{
                id:discardTZChange
                text:qsTr("cancel")
                anchors{
                    margins:10
                    bottom: parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                onClicked:{
                    pgSelector.selectedContent=timeModel.currentTimeZone
                    tzPageHolder.sourceComponent=tzDisplay
                }
            }
        }
    } 
}
