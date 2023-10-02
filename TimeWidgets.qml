import QtQuick 2.12
import QtQuick.Controls 2.5

import QtQuick.VirtualKeyboard.Settings 2.1
import QtQuick.Layouts 1.12
CustomRect{
    id: timeWidget
    property date date: timeModel.currentTime
    property date userDate: new Date(timeModel.currentTime)
    anchors{
    }
    Loader{
        anchors.fill:timeWidget
        id:timeEditScreens
        sourceComponent: timeDisplayScreen
        
    }
    width:parent.width*0.4
    
    Component{
        id:timeDisplayScreen
        
        Item{
            id:mRoot
            property date date: timeWidget.date
            
            TimeDisplayLabel{
                id: monthLabel
                anchors{
                    bottom:mRoot.verticalCenter
                    horizontalCenter: mRoot.horizontalCenter
                    margins: 15
                }
                width:70
                text: mRoot.date.getMonth()
                underLabel: "month"
            }
            TimeDisplayLabel{
                id:dayDisplay
                anchors{
                    verticalCenter: monthLabel.verticalCenter
                    right:monthLabel.left
                    margins: 15
                }
                width:70
                text: mRoot.date.getDate()
                underLabel: "day"
            }
            TimeDisplayLabel{
                id:yearDisplay
                anchors{
                    verticalCenter:monthLabel.verticalCenter
                    left:monthLabel.right
                    margins: 15
                }
                width:70
                text:mRoot.date.getFullYear()
                underLabel: "year"
            }
            TimeDisplayLabel{
                id:minuteDisplay
                underLabelUp:true
                anchors{
                    bottom:monthLabel.top
                    right: mRoot.horizontalCenter
                    margins: 15
                }
                width:70
                text:mRoot.date.getMinutes()
                underLabel: "min"
            }
            TimeDisplayLabel{
                id:hourDisplay
                underLabelUp:true
                anchors{
                    bottom:monthLabel.top
                    left: mRoot.horizontalCenter
                    margins:15
                }
                width:70
                text:mRoot.date.getHours()
                underLabel: "hour"
            }
            TextButton{
                id:startTimeEdit
                enabled: !autoTime.toggled
                text:"edit"
                anchors{
                    horizontalCenter: mRoot.horizontalCenter
                    margins:15
                }
                onClicked: {
                    timeEditScreens.sourceComponent=dateEditScreen
                    
                }
                y:monthLabel.y+70
                width:70
            }
            CustomCheckbox{
                id: autoTime
                
                anchors{
                    horizontalCenter: parent.horizontalCenter
                    top:startTimeEdit.bottom
                }
                height:40
                text: "use NIP"
                
            }
        }
    }
    Component{
        id:dateEditScreen
        Item{
            id: dateEdit
            TextButton{
                id:cancelBTN
                anchors{
                    left:parent.left
                    bottom:parent.bottom
                }
                text:"отмена"
                onClicked: {
                    timeEditScreens.sourceComponent=timeDisplayScreen
                }
            }
            TextButton{
                id:nextBTN
                property bool toggled: false
                anchors{
                    right:parent.right
                    bottom:parent.bottom
                }
                onClicked: {
                    var d = dateEdit.unPackDate(parseInt(dayChange.value),parseInt(monthChange.value),parseInt(yearChange.value))
                    console.log(d)
                    if(d!==null){
                        
                        timeWidget.userDate=d
                        timeEditScreens.sourceComponent=hourMinsEditScreen
                    }
                    else{
                        
                        statusBar.state="Showed"
                        hideTimer.restart()
                        
                    }
                    
                }
                
                text:"далее"
            }
            TimeEditLine {
                id: dayChange
                anchors{
                    right:monthChange.left
                    verticalCenter: monthChange.verticalCenter
                    margins:10
                }
                signatureText:"input day"
            }
            TimeEditLine {
                id: monthChange
                anchors{
                    centerIn: parent
                    margins:10
                }
                signatureText: "input month"
            }
            TimeEditLine {
                id: yearChange
                anchors{
                    left:monthChange.right
                    verticalCenter: monthChange.verticalCenter
                    margins:10
                }
                signatureText: "input year"
            }
            TimeStatusBar {
                id: statusBar
                anchors.bottom: dateEdit.bottom
                anchors.left: cancelBTN.right
                anchors.right: nextBTN.left
                text: "invalid date"
            }
            Component.onCompleted: {
                var d = timeWidget.date
                dayChange.value=d.getDate()
                monthChange.value=d.getMonth()
                yearChange.value=d.getFullYear()
                
            }
            Timer{
                id:hideTimer
                interval:500
                running:false
                repeat:false
                onTriggered:{
                    statusBar.state="Hidden"
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
        }
        
        
    }
    Component{
        id:hourMinsEditScreen
        Item{
            id:timeEdit
            TextButton{
                id:backBTN
                anchors{
                    left:parent.left
                    bottom:parent.bottom
                }
                text:"назад"
                onClicked: {
                    timeEditScreens.sourceComponent=dateEditScreen
                }
            }
            TextButton{
                id:submitBTN
                property bool toggled: false
                anchors{
                    right:parent.right
                    bottom:parent.bottom
                }
                onClicked: {
                    var a = timeEdit.unpackTime(parseInt(minuteChange.value),parseInt(hourChange.value))
                    if(a === null){
                        statusBar2.state="Showed"
                        hideTimer2.restart()
                    }
                    else{
                        timeWidget.userDate=a
                        timeModel.currentTime = timeWidget.userDate
                        
                        timeEditScreens.sourceComponent=timeDisplayScreen
                    }
                }
                
                text:"установить"
            }
            
            
            TimeEditLine{
                id:minuteChange
                signatureText: "input minute"
                anchors{
                    verticalCenter: timeEdit.verticalCenter
                    right: timeEdit.horizontalCenter
                }
            }
            TimeEditLine{
                id:hourChange
                signatureText: "input hour"
                anchors{
                    verticalCenter: timeEdit.verticalCenter
                    left:minuteChange.right
                }
            }
            TimeStatusBar {
                id: statusBar2
                anchors.bottom: timeEdit.bottom
                anchors.left: backBTN.right
                anchors.right: submitBTN.left
                text: "invalid time"
            }
            Timer{
                id:hideTimer2
                interval:500
                running:false
                repeat:false
                onTriggered:{
                    statusBar2.state="Hidden"
                }
            }
            
            Component.onCompleted: {
                var d= timeModel.currentTime
                minuteChange.value=d.getMinutes()
                hourChange.value=d.getHours()
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
                    let cloneTime = new Date(timeWidget.userDate.getFullYear(), timeWidget.userDate.getMonth(), timeWidget.userDate.getDate(),hour, minute)
                    return cloneTime
                }
                return null
            }
        }
    }
}
