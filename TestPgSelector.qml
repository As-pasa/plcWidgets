import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
CustomRect{
    id:root
    radius: 10
//    anchors{
//        top:header.bottom
//        left:parent.left
//        right:parent.right
//        bottom:parent.bottom
//    }
    property var model: "1 2 3 4 5 6 7 8 9 10".split(" ")
    property alias delegate:supplier.delegate
    property alias signature : signatureLabel.data
    property alias contextButtons:contextButtons.data
    property string contextButtonText:qsTr("connect")

    property alias columnsOnPage: pgsViewGrid.columns
    property alias rowsOnPage:pgsViewGrid.rows
    property var pageModel:{

        model.slice(currentPageStartIndex, currentPageEndIndex)
    }
    property int elementsOnCurrentPage: currentPageEndIndex-currentPageEndIndex
    property int currentPage:0
    property int currentPageStartIndex: currentPage*(columnsOnPage*rowsOnPage)
    property int currentPageEndIndex:Math.min((currentPage+1)*(columnsOnPage*rowsOnPage), model.length)


    
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 15

        Item{
            
            id:pgsView
            Layout.fillHeight: true
            Layout.fillWidth: true
            GridLayout{
                Item{
                    id:signatureLabel
                    Layout.preferredHeight: 30
                    Layout.fillWidth: true

                }

                anchors.fill: parent
                id:pgsViewGrid
                Repeater{
                    model:root.pageModel
                    id:supplier
                }
                Item{
                    Layout.fillHeight: true
                }
            }
        }
        Item{
            
            id:pgsToolbar
            Layout.fillWidth: true
            Layout.minimumHeight: 100
            RowLayout{
                anchors.fill: parent
                spacing: 20

                TextButton{
                    text:qsTr("prev page")
                    Layout.preferredWidth: 200
                    Layout.alignment: Qt.AlignLeft

                    onClicked: {

                        if(root.currentPage>=1){

                            root.currentPage-=1
                        }
                    }
                }
                Item{
                    id:contextButtons
                    Layout.fillHeight: true

                    Layout.preferredWidth: 120
                }

                TextButton{
                    Layout.preferredWidth: 200
                    Layout.alignment: Qt.AlignRight
                    text:qsTr("next page")
                    onClicked: {
                        if(root.currentPageEndIndex<root.model.length){
                            root.currentPage+=1
                        }
                    }
                }
            }
        }
    }
}
