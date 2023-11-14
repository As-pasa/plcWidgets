import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
CustomRect{
    id:root
    radius: 10
    property var model: "1 2 3 4 5 6 7 8 9 10".split(" ")
    property alias delegate:supplier.delegate
    property alias signature : signatureLabel.data
    property alias contextButtons:contextButtons.data
    property string contextButtonText:qsTr("connect")

    property alias columnsOnPage: pgsViewGrid.columns
    property alias rowsOnPage:pgsViewGrid.rows
    property var pageModel:model.slice(currentPageStartIndex,currentPageEndIndex)

    property int elementsOnCurrentPage: currentPageEndIndex-currentPageEndIndex
    property int currentPage:0
    property int currentPageStartIndex: currentPage*(columnsOnPage*rowsOnPage)
    property int currentPageEndIndex:Math.min((currentPage+1)*(columnsOnPage*rowsOnPage), model.length)
    onCurrentPageEndIndexChanged:{

        pageModel= model.slice(currentPageStartIndex,currentPageEndIndex)
    }


    
    RowLayout{
        anchors.fill: parent
        anchors.margins: 5

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
            Layout.preferredWidth: 100
            Layout.fillHeight: true
            ColumnLayout{
                anchors.fill: parent
                spacing: 2

                TextButton{
                    text:qsTr("prev page")
                    Layout.minimumHeight: parent.height/4
                    Layout.maximumHeight: 70
                    Layout.fillWidth: true


                    onClicked: {

                        if(root.currentPage>=1){

                            root.currentPage-=1
                        }
                    }
                }
                Item{
                    id:contextButtons
                    Layout.fillHeight: true
                    Layout.minimumHeight: 70
                    Layout.maximumHeight: 200
                    Layout.fillWidth: true
                }

                TextButton{
                    Layout.minimumHeight: parent.height/4
                    Layout.maximumHeight: 70
                    Layout.fillWidth: true

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
