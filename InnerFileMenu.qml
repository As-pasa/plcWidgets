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
                axisY: BarCategoryAxis { categories: ["inner"] }
                BarSet { label: "used"; values: [40] }
                BarSet { label: "delta"; values: [0] }
                BarSet { label: "free"; values: [40] }
            }
        }
        
        
        
        
    }
    CustomRect{
        id:buttonMenu
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
                text:"delete"
                Layout.fillHeight: true
                Layout.fillWidth: true 
                onClicked: {
                    fileDeleteDialog.open()
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
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"format"
                Layout.fillHeight: true
                Layout.fillWidth: true
                onClicked: {
                    fileDeleteDialog.open()
                }

            }

            Dialog{
                id:fileDeleteDialog



                implicitWidth: parent.width
                implicitHeight: parent.height

                background: CustomRect{
                    radius: 15

                }
                ColumnLayout{
                    anchors.fill: buttonMenu
                    CustomLabel{

                        text:"submit changes"
                        Layout.alignment: Qt.AlignHCenter
                    }
                    DialogButtonBox{

                        Layout.alignment: Qt.AlignHCenter
                         background: CustomRect{
                            border.width: 0
                        }

                        TextButton{
                            text:"accept"
                            DialogButtonBox.buttonRole: DialogButtonBox.AcceptRole
                            onClicked: {

                                fileDeleteDialog.accept()
                            }

                        }
                        TextButton{
                            text:"cancel"
                            DialogButtonBox.buttonRole: DialogButtonBox.RejectRole
                            onClicked: {
                                fileDeleteDialog.reject()
                            }
                        }

                    }

                }




            }

        }
    }
    
    
}
