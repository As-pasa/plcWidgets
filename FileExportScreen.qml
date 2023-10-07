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
        property var selectedContent:[]
        source:fileModel.innerFiles
        width:root.width*0.5
        delegate: TextButton{
            anchors{
                left:parent.left
                right:parent.right
                margins: 5
            }
            
            text:modelData
            background: CustomRect{

                property bool isSelected:pgSelector.selectedContent.includes(parent.text)

                border.width:0
                color:
                    isSelected?clickedColor : defaultColor
                
            }

            
            onClicked: {

                if(pgSelector.selectedContent.includes(text)){
                    pgSelector.selectedContent=pgSelector.selectedContent.filter( ob=>{
                                                                                     return ob!==modelData})
                    //background.color=colorPicker.defaultColor
                }
                else{
                    pgSelector.selectedContent.push(text)
                    //background.color=colorPicker.clickedColor
                }
                console.log(pgSelector.selectedContent.includes(text))
            }
        }
        Component.onCompleted:{
            selectedContent=[]

            
            
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
                text:"select all"
                onClicked:{

                    pgSelector.selectedContent=pgSelector.source
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"drop all"
                onClicked:{
                    pgSelector.selectedContent=[]
                    console.log(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"export"
                onClicked: {
                    fileModel.backupFiles(pgSelector.selectedContent)
                }
            }
            TextButton{
                Layout.alignment: Qt.AlignHCenter
                text:"refresh"
                onClicked: {
                    fileModel.refreshInner()

                }
            }
        }
    }
    
    
}
