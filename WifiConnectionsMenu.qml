import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
TestPgSelector {
    id: root
    property string selectedContent:""
    
    signature: CustomRect{
        anchors.fill: parent


        RowLayout{
            anchors.fill: parent

            Text{
                Layout.preferredWidth: parent.width/2
                Layout.leftMargin: 15
                text:"Наименование сети"
            }

            Text{

                text:"Защита"
            }
            Text{

                text:"Сигнал"
            }

        }
    }
    contextButtons:Item{
        anchors.fill: parent
        RowLayout{
            anchors.fill: parent
            TextButton{
                text:"connect"
                onClicked: {
                    wifiConnectDialog.open()
                }
            }
            TextButton{
                text:"refresh"
                onClicked: {
                    wifiModel.refresh()
                }
            }
        }
        
    }
    delegate:
        CustomRect{
        Layout.preferredHeight: 50
        
        Layout.fillWidth: true
        property int idx : root.pageModel[index]
        color: (root.selectedContent===identifier.text)? clickedColor: defaultColor
        RowLayout{
            anchors.fill: parent
            Text{
                Layout.leftMargin: 15
                id:identifier
                Layout.preferredWidth: parent.width/2
                text:wifiModel.fromId(idx).name
            }
            Text{
                id:security
                text:wifiModel.fromId(idx).security
            }
            Text{
                id:signal
                text:wifiModel.fromId(idx).signal1
            }
        }
        MouseArea{
            id:clicker
            anchors.fill: parent
            onClicked: {
                
                if(root.selectedContent=== wifiModel.fromId(idx).name){
                    root.selectedContent=""
                }
                else{
                    root.selectedContent=wifiModel.fromId(idx).name
                }
            }
        }
        
    }
    
    
    
    
    
    
    
    model: range(wifiModel.declaredLength)
    rowsOnPage:root.height/(1.6*50)
    columnsOnPage:1
    function range(x){
        let declaredIndexes=[]
        for(var i = 0 ; i <wifiModel.declaredLength;i++){
            declaredIndexes.push(i)
        }
        return declaredIndexes
    }
    
    Dialog{
        id:wifiConnectDialog
        anchors.centerIn: parent
        width:parent.width/2
        height:parent.height/2
        modal:true
        title: "Connecting to wifi: "+ root.selectedContent
        //            TextKeyboardField{
        //                id:textInput
        //                anchors.centerIn: parent
        //                width: parent.width
        //                height:parent.height
        //                signature: "input password"
        //                value: ""
        //            }
        footer:DialogButtonBox{
            TextButton{
                text:"connect"
                onClicked: {
                    if(textInput.value!==""){
                        console.log("try to connect")
                        wifiConnectDialog.close()
                    }
                }
            }
            TextButton{
                text:"cancel"
                onClicked: wifiConnectDialog.close()
            }
        }
    }
    
}
