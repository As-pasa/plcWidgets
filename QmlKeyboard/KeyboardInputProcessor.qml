import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0


import "../widgets"


Item{
    id:textProcessor
    
    function process(ch){
        keyBinder.process(role,ch)
    }
    property string txt:""
    property int role:1
    Connections{
        target:keyBinder
        function onStateChanged(){
            textProcessor.txt=keyBinder.getState(textProcessor.role)
        }
    }
    Component.onCompleted: textProcessor.txt=keyBinder.getState(textProcessor.role)
}
