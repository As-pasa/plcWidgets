import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    ColumnLayout{
        anchors.fill: parent
        Text{
            
            wrapMode:
                Text.Wrap
            //: password recovery screen
            text:qsTr("To recover your password, \n please contact one of the addresses provided.")
        }
        Repeater{
            
            model:(passwordModel!==null)? passwordModel.contacts: ['Foo']
            CustomLabel{
                fontSize: 15
                bb:"white"
                Layout.fillWidth: true
                text:modelData
            }
        }
    }
    
}
