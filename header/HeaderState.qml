import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import "../widgets"



HeaderBase {
    height:70
    id: headerState
    states:[
        State{
            name:barModel.getStateName(Header.Closed)
            PropertyChanges {
                target: headerState
                height:0
                visible:false
                
            }
        },
        State{
            name:barModel.getStateName(Header.Opened)
            PropertyChanges{
                target:headerState
                height:70
                visible:true
            }
            PropertyChanges{
                target:backBtn
                onClicked:{
                    screenController.prevScreen()
                }
            }
        },
        State{
            name: barModel.getStateName(Header.Password)
            PropertyChanges{
                target: headerState
                height:70
                visible:true
            }
            PropertyChanges{
                target:backBtn
                onClicked:{
                    screenController.goToScreen(Screens.PasswordRecovery)
                }
            }
        }
        
    ]
}
