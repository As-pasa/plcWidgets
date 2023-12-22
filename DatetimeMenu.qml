import QtQuick 2.12
import QtQuick.Controls 2.5
import "virtualKeyboards"
import QtQuick.Layouts 1.12

Item{


CustomRect{
    id:timeSegment
    property date curDate : timeModel.currentTime
    radius: 10
    anchors.fill: parent
    anchors.margins: 5
    ColumnLayout{
        anchors.fill: parent
        anchors.margins: 5
        SignedLabel{
            underLabel:qsTr("current datetime") +"(h : m dd/mm/yyyy)"
            text:
                `${timeSegment.curDate.getHours()} : ${timeSegment.curDate.getMinutes()}  ${timeSegment.curDate.getDate()}/${timeSegment.curDate.getMonth()+1}/${timeSegment.curDate.getFullYear()}`
            
            
            Layout.preferredHeight:70
            Layout.fillWidth: true
            
        }
        TextButton{
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            text:qsTr("edit")
            onClicked: timeEditDialog.open()
            enabled: (autoTimeOption.toggled)?false:true
        }
        Item{
            Layout.preferredHeight: 30
            Layout.fillWidth: true
            
            CustomCheckbox{
                id:autoTimeOption
                anchors{
                    top:parent.top
                    bottom:parent.bottom
                    horizontalCenter: parent.horizontalCenter
                }
                width:100

                text:qsTr("AUTO")
                toggled: timeModel.NIPStatus
                onToggledChanged: timeModel.NIPStatus=toggled
            }
        }
    }
    Dialog{
        parent:Overlay.overlay
        id:timeEditDialog
        anchors.centerIn: parent
        width:parent.width
        height:parent.height
        modal:true

        GridLayout{
            anchors.fill:parent
            IntKeyboardInputField{
                id:minuteEdit

                Layout.fillWidth: true
                signature:qsTr("Minute(0-59)")
                value: timeSegment.curDate.getMinutes()
            }
            IntKeyboardInputField{
                id:hourEdit
                Layout.fillWidth: true

                signature:qsTr("Hour(0-23)")
                value: timeSegment.curDate.getHours()
            }
            IntKeyboardInputField{
                id:dayEdit
                Layout.fillWidth: true

                signature:qsTr("Day(0-30)")
                value:{

                    timeSegment.curDate.getDate()
                }
            }
            IntKeyboardInputField{
                id:monthEdit
                Layout.fillWidth: true

                signature:qsTr("Month(1-12)")
                value: timeSegment.curDate.getMonth()+1
            }
            IntKeyboardInputField{
                id:yearEdit
                Layout.fillWidth: true

                signature:qsTr("Year")
                value: timeSegment.curDate.getFullYear()
            }
        }

        footer:DialogButtonBox{
            TextButton{
                text:qsTr("accept")
                onClicked: {
                    var a = timeEditDialog.unPackDate(parseInt(dayEdit.value),parseInt(monthEdit.value-1) ,parseInt(yearEdit.value))
                    var b = timeEditDialog.unpackTime(parseInt(minuteEdit.value),parseInt(hourEdit.value) )

                    if(a!==null && b!==null){
                        timeModel.setCurrentTime(new Date(yearEdit.value,monthEdit.value-1,dayEdit.value,hourEdit.value,minuteEdit.value))
                        timeEditDialog.close()
                    }
                }
            }
            TextButton{
                text:qsTr("cancel")
                onClicked: timeEditDialog.close()
            }
        }
        function unPackDay(day,month,year){

                        if (month === 1){
                            if(year %4===0) {
                                if(day >29)  return null
                                return day
                            }

                            else{
                                if(day>28)  return null
                                return day
                            }
                        }
                        else{
                            if(month%2===0){
                                if(day >31) return null
                                return day
                            }
                            else{
                                if(day>30)return null
                                return day
                            }
                        }
                    }
                    function unPackMonth(day,month,year){
                        if(month >=0 && month<12)return month
                        return null
                    }
                    function unPackDate(day,month,year){

                        var c1=unPackDay(day,month,year)
                        var c2=unPackMonth(day,month,year)
                        if(c1!==null && c2!==null){
                            return new Date(year,month,day)

                        }

                        return null
                    }

        function unPackMinute(minute){
                    if(minute>=0 && minute <60){
                        return minute
                    }
                    return null
                }
                function unPackHour(hour){
                    if(hour>=0 && hour<24){
                        return hour
                    }
                    return null
                }
        function unpackTime(minute,hour){
            if(unPackMinute(minute)!==null && unPackHour(hour)!==null){

                return true
            }
            return null
        }
    }
}
}
