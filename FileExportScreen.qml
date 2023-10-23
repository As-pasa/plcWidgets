import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
Item{
    id:root

    CustomRect{
        id:colorPicker
        width: 0
        height:0
    }
    PageSelector{
        id:pgSelector
        anchors{
            margins: 15
            top:parent.top
            bottom:parent.bottom
            left:parent.left
            
        }
        pageSize: 8
        property var selectedContent:[]
        property var selectAll:false
        source:fileModel.innerFiles
        width:root.width*0.5
        delegate:TextButton{
            background: CustomRect{
                color:pgSelector.selectedContent.includes(text)?colorPicker.clickedColor:colorPicker.buttonColor


            }
            Connections{
                target:pgSelector
                function onSelectAllChanged(){

                    background.color=pgSelector.selectedContent.includes(text)?colorPicker.clickedColor:colorPicker.buttonColor
                }
            }

            text:modelData
            anchors{
                left:parent.left
                right:parent.right
                margins:10
            }
            onClicked: {
                if(pgSelector.selectedContent.includes(text)){
                    pgSelector.selectedContent=pgSelector.selectedContent.filter( (a)=>{return a!==modelData} )
                    pgSelector.selectAll=!pgSelector.selectAll
                }
                else{
                    pgSelector.selectedContent.push(text)
                    pgSelector.selectAll=!pgSelector.selectAll
                }
            }
        }

    }
    CustomRect{
        radius:20
        id:usageDisplay
        anchors{
            margins:15
            top:parent.top
            right:parent.right
            left:pgSelector.right
            
        }
        height:parent.height*0.5
        
        ChartView {
            backgroundColor: usageDisplay.defaultColor
            title: "space usage"
            anchors.fill: parent
            legend.alignment: Qt.AlignBottom
            antialiasing: true
            
            HorizontalStackedBarSeries {
                axisY: BarCategoryAxis { categories: ["inner", "outer"] }
                BarSet { label: "used"; values: [40, 40] }
                BarSet { label: "delta"; values: [0, 0] }
                BarSet { label: "free"; values: [40, 40] }
            }
        }
        
        
        
        
    }
    CustomRect{
        radius: 20
        anchors{
            margins:15
            top:usageDisplay.bottom
            left:pgSelector.right
            right:parent.right
            bottom:parent.bottom
        }
        GridLayout{
            columns:2
            anchors{
                fill:parent
                margins:10
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                text:"select all"
                onClicked:{

                    pgSelector.selectedContent=pgSelector.source
                    pgSelector.selectAll=!pgSelector.selectAll
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"drop all"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked:{
                    pgSelector.selectedContent=[]
                    pgSelector.selectAll=!pgSelector.selectAll
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"export"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.backupFiles(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"refresh"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.refreshInner()

                }
            }
        }
        Loader{
            anchors.fill: parent
            sourceComponent: exportFileNameForm

        }

    }
    
    Component{
        id:exportFileNameForm
        Item{

            ColumnLayout{
                anchors{
                    top:parent.top
                    left:parent.left
                    right: parent.right
                    bottom:buttonRow.top
                    margins: 8
                }


                Item{
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    id:rt
                    property string value: "config"
                    property string signature:"signValue"

                    ColumnLayout{
                        anchors.fill: parent

                        Text{
                            Layout.alignment: Qt.AlignCenter
                            text:"heave ho"
                            horizontalAlignment: Qt.AlignHCenter
                        }


                        CustomRect{
                            id:boo
                           Layout.fillHeight: true
                           Layout.fillWidth: true
                           color:"red"
                           MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                aaa.forceActiveFocus()
                            }
                           }
                           TextInput{
                               id:aaa
                               anchors.centerIn: parent
                            text:"need to whatch caribian"
                            onEditingFinished: {
                                boo.forceActiveFocus()
                            }
                            onAccepted: {
                                boo.forceActiveFocus()
                            }
                           }
                        }
                    }
                }


            }
            CustomRect{
                id:buttonRow
                color:"red"
                anchors{
                    bottom: parent.bottom
                    left:parent.left
                    right: parent.right


                }
                height: 40
                RowLayout{

                    anchors.fill: parent


                    TextButton{
                        Layout.alignment: Qt.AlignRight

                        text:"submit"
                    }
                    TextButton{
                        Layout.alignment: Qt.AlignLeft
                        text:"cancel"
                    }
                }
            }
        }
    }
    Component {
        id:toolPane
        GridLayout{
            columns:2
            anchors{
                fill:parent
                margins:10
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true
                Layout.fillWidth: true
                text:"select all"
                onClicked:{

                    pgSelector.selectedContent=pgSelector.source
                    pgSelector.selectAll=!pgSelector.selectAll
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"drop all"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked:{
                    pgSelector.selectedContent=[]
                    pgSelector.selectAll=!pgSelector.selectAll
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"export"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.backupFiles(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"refresh"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileModel.refreshInner()

                }
            }
        }
    }

}
