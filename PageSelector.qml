import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
CustomRect{

    radius: 20
    function next(){
        currentPage=Math.min(currentPage+1, Math.floor(source.length/pageSize ) )
    }
    function prev(){
        currentPage=Math.max(0, currentPage-1)
    }
    property alias delegate:lview.delegate
    id:pgSelector
    property var source: ["data","betta","gamma","gamma1","gamma2","gamma3","gamma4","gamma5"]
    property int currentPage:0
    property int pageSize:5

    ListView{
        anchors{
            top:parent.top
            topMargin: 15
            bottom:navpan.top
            left:parent.left
            right:parent.right
        }
        id:lview
        model:(pgSelector.source.length===0)? [] :  pgSelector.source.slice(pgSelector.currentPage*pgSelector.pageSize, pgSelector.currentPage*pgSelector.pageSize+pgSelector.pageSize)


        
    }
    RowLayout{
        id:navpan
        anchors{
            margins: 5
            bottom:parent.bottom
            left:parent.left
            right:parent.right
        }
        TextButton{
            text:qsTr("prev page")
            Layout.alignment: Qt.AlignRight
            Layout.fillWidth: true
            onClicked: {
                pgSelector.prev()
            }
        }
        
        TextButton{
            text:qsTr("next page")
            Layout.alignment: Qt.AlignLeft
            Layout.fillWidth: true
            onClicked: {
                pgSelector.next()
            }
        }
        
        
    }
}
