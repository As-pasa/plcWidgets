import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
CustomLabel{
    id: statusBar
    anchors{
    }
    state:"Hidden"
    states:[
        State{
            name:"Hidden"
            
            PropertyChanges {
                target: statusBar
                opacity:0.0
            }
        },
        State{
            name:"Showed"
            
            PropertyChanges {
                target: statusBar
                opacity:1.0
                
            }
        }
    ]
    transitions:[
        Transition{
            from:"Hidden"; to:"Showed"
            
            NumberAnimation {
                target: statusBar
                property: "opacity"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        },
        Transition{
            from: "Showed"; to: "Hidden"
            NumberAnimation {
                target: statusBar
                property: "opacity"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    ]
}
