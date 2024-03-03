import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0


Item{
    id:root

    signal triggered(string content)
    property var model : "raz dva tri chetire pyat shest sem vosem devat desiat".split(" ")
    property int pageSize: 5
    property var pgModel:{
        var a = []
        for(let i =0 ; i < model.length;i+=pageSize){
            a.push(model.slice(i,i+pageSize))
        }
        return a
    }
    property int currentPage:0
    RowLayout{
        anchors.fill:parent
        anchors.margins: 2
        Item{
            Layout.fillHeight: true
            Layout.fillWidth: true
            ColumnLayout{
                anchors.fill: parent
                Repeater{
                    id:rpt
                    model:root.pgModel[root.currentPage]
                    delegate:TextBtn{
                        onClicked: root.triggered(modelData)
                        text:modelData
                        fontSize: fontSmall

                    }
                }
            }
        }
        Item{
            Layout.fillHeight: true
            Layout.preferredWidth: 100
            ColumnLayout{
                anchors.fill:parent
                
                TextBtn{
                    text:"next"
                    onClicked: root.currentPage= Math.min(root.currentPage+1,root.pgModel.length-1)
                }
                
                TextBtn{
                    text:"prev"
                    onClicked: root.currentPage=Math.max(0,root.currentPage-1)
                }
            }
        }
        
    }
}
