import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
ApplicationWindow {
    id: window
    visible: true
    width: 800
    height: 480
    title: qsTr("Tabs")

//    MainScreen{
//        anchors.fill:parent
//    }

    HeaderBar {
        id:header
        anchors.left: parent.left
        anchors.right: parent.right
        onCenterClicked: mainScreen.state="mainMenu"

    }
    Item{
        id:root
        anchors{
            top:header.bottom
            bottom:parent.bottom
            right:parent.right
            left:parent.left
        }
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

            width:root.width*0.5
            delegate: TextButton{
                anchors{
                    left:parent.left
                    right:parent.right
                    margins: 5
                }

                text:modelData
                background: CustomRect{

                    border.width:0
                    color:
                    pgSelector.selectedContent.includes(text)?clickedColor : defaultColor

                }

                onClicked: {

                    if(pgSelector.selectedContent.includes(text)){
                        pgSelector.selectedContent=pgSelector.selectedContent.filter( ob=>{
                        return ob!==modelData})
                        background.color=colorPicker.defaultColor
                        }
                    else{
                        pgSelector.selectedContent.push(text)
                        background.color=colorPicker.clickedColor
                        }
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
            ColumnLayout{
                anchors{
                    fill:parent
                    margins:10
                }
                TextButton{
                    Layout.alignment: Qt.AlignHCenter
                    text:"select all"
                    onClicked: pgSelector.selectedContent=pgSelector.source
                }
                TextButton{
                    Layout.alignment: Qt.AlignHCenter
                    text:"drop all"
                    onClicked: pgSelector.selectedContent=[]
                }
                TextButton{
                    Layout.alignment: Qt.AlignHCenter
                    text:"export"

                }
                TextButton{
                    Layout.alignment: Qt.AlignHCenter
                    text:"refresh"

                }
            }
        }


    }


    Binding {
        target: VirtualKeyboardSettings
        property: "fullScreenMode"
        value:true
    }

}
