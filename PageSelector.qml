import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
CustomRect{

    radius: 30
    function next(){
        currentPage=Math.min(currentPage+1, Math.floor(source.length/pageSize ) )
    }
    function prev(){
        currentPage=Math.max(0, currentPage-1)
    }
    
    
    
    id:pgSelector
    property var source: ["data","betta","gamma","gamma1","gamma2","gamma3","gamma4","gamma5"]
    property int currentPage:0
    property int pageSize:5
    property string selectedContent:"data"
    ListView{
        anchors{
            top:parent.top
            topMargin: 15
            bottom:navpan.top
            left:parent.left
            right:parent.right
        }
        id:lview
        model:pgSelector.source.slice(pgSelector.currentPage*pgSelector.pageSize, pgSelector.currentPage*pgSelector.pageSize+pgSelector.pageSize)
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
    RowLayout{
        id:navpan
        anchors{
            margins: 5
            bottom:parent.bottom
            left:parent.left
            right:parent.right
        }
        TextButton{
            text:"prev page"
            Layout.alignment: Qt.AlignRight
            onClicked: {
                pgSelector.prev()
            }
        }
        
        TextButton{
            text:"next page"
            Layout.alignment: Qt.AlignLeft
            onClicked: {
                pgSelector.next()
            }
        }
        
        
    }
}
