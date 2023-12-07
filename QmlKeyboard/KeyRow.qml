import QtQuick 2.12
import QtQuick.Controls 2.5
import QtCharts 2.10
import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
import ".."
Item{
    id:root
    property var model:'`@@~ 1@@! 2@@@ 3@@# 4@@$ 5 6@@^ 7@@& 8@@* 9@@( 0@@) -@@_ =@@+ backspace'.split(" ")

    GridLayout{
        anchors.fill: parent
        rowSpacing: 2
        rows:1
        columns:15
        Repeater{
            model:root.model
            CustomRect{
                Layout.fillHeight: true
                Layout.minimumWidth: parent.width/14
                Layout.maximumWidth: parent.width
                radius: 15
                border.width:1
                Layout.columnSpan: {
                    if("enter backspace shift space".split(" ").includes(modelData)){

                        return 2

                    }
                    return 1

                }

                Text{
                    anchors.centerIn: parent
                    text:modelData.split("@@")[0]
                }
                Text{
                    anchors.margins: 5
                    anchors.top:parent.top
                    anchors.right:parent.right
                    text:(modelData.split("@@")[1]===undefined)? "":  modelData.split("@@")[1]
                }
            }
        }

    }


}
