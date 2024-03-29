import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import ".."
Dialog{
    id:root
    property string data : "123"
    property var client: null
    property string state: "closed numbers"
    function addSymbol(c){
        if(c==="enter"){
            if(client!==null){
                client.value = data
                client.enterPressed()
            }
            
            root.close()
        }
        else if(c==="close"){
            root.close()
        }
        else if(c==="back"){
            data=data.slice(0,-1)
        }
        else if(c.toLowerCase() === "shift"){
            rt.shiftDown= !rt.shiftDown
        }
        else if (c.toLowerCase()==="&123"){
            state="special symbols"
        }
        else if( c.toLowerCase()==="abc"){
           state=rt.lastLan
        }
        else if(c.toLowerCase()==="en"){
            state="en keyboard"
        }
        else if(c.toLowerCase()==="ru"){
            state="ru keyboard"
        }
        else if(c.toLowerCase()==="space"){
            data=data+" "
        }
        else{
            data+=c
        }
    }
    width:parent.width
    height:parent.height
    background: CustomRect{
        border.width: 0
        radius: 0
        color: "black"
    }
    ColumnLayout{
        anchors.fill: parent
        
        
        CustomLabel{
            background:
                CustomRect{
                color:Qt.darker("grey")
                radius: 10
            }
            
            text:root.data
            color:"white"
            
            Layout.fillWidth: true
            Layout.minimumHeight: parent.height/6
            horizontalAlignment: Qt.AlignHCenter
            font.pixelSize: 30
        }
        
        NumPad {
            id: rt
            property string lastLan:"ru keyboard"
            colSpanFunction: (a)=>{
                                 if(a==="space") return 10
                                 return 1}
            rowSpanFunction: (a)=> {return 1}
            columnCount: 11
            state:root.state
            onKeyPressed: root.addSymbol(key)
            Layout.fillHeight: true
            Layout.fillWidth: true
            states:[
                State{
                    name:"special symbols"
                    PropertyChanges {
                        target: rt
                        columnCount:10
                        model: "1 2 3 4 5 6 7 8 9 0 ! @ # $ % ^ & * ( ) - _ = + [ ] { } | \\ : ; \' \" , . / < > ? ~ ` back space abc enter".split(" ")
                        colSpanFunction:(a)=> {
                                            if(a==="space")return 2
                                            if(a==="back")return 2
                                            if(a==="abc")return 2
                                            if(a==="enter")return 2
                                            return 1
                                        }
                        rowSpanFunction: (a)=> {return 1}
                        
                    }
                },
                State{
                    name: "en keyboard"
                    PropertyChanges{
                        target:rt
                        lastLan: "en keyboard"
                        columnCount:10
                        model: "q w e r t y u i o p a s d f g h j k l \' z x c v b n m , . ? back shift enter close ru space &123".split(" ")
                        colSpanFunction:(a)=> {
                                            if(a==="back")return 3
                                            if(a==="shift")return 2
                                            if(a==="enter")return 2

                                            if(a==="close")return 3



                                            if(a==="ru")return 3
                                            if(a==="space")return 4
                                            if(a==="&123")return 3
                                            
                                            return 1
                                        }
                        rowSpanFunction: (a)=> {return 1}
                        
                    }
                },
                State{
                    name: "ru keyboard"
                    PropertyChanges{
                        target:rt
                        lastLan:"ru keyboard"
                        model: "й ц у к е н г ш щ з х ъ ф ы в а п р о л д ж э я ч с м и т ь б ю back shift enter close space en &123".split(" ")
                        columnCount:12
                        colSpanFunction:(a)=> {
                                            if(a==="back")return 2
                                            if(a==="shift")return 2
                                            if(a==="enter")return 2
                                            if(a==="close")return 2
                                            if(a==="space")return 4
                                            if(a==="en")return 2
                                            if(a==="&123")return 2
                                            return 1
                                        }
                        rowSpanFunction: (a)=> {return 1}
                    }
                },
                State{
                    name: "closed numbers"
                    PropertyChanges{
                        target:rt
                        model: "7 8 9 back 4 5 6 enter 1 2 3 0 close".split(" ")
                        rowSpanFunction: (a)=> {
                                            if(a==="enter") return 2
                                              return 1
                                          }
                        colSpanFunction: (a)=> {
                                            if(a==="0")return 3
                                               return 1
                                           }
                        columnCount:4
                    }

                },
                State{
                    name: "ipInput"
                    PropertyChanges{
                        target:rt
                        model: "7 8 9 back 4 5 6 enter 1 2 3 0 . close".split(" ")
                        rowSpanFunction: (a)=> {
                                            if(a==="enter") return 2
                                              return 1
                                          }
                        colSpanFunction: (a)=> {
                                            if(a==="0")return 2
                                               return 1
                                           }
                        columnCount:4
                    }
                }
            ]
        }
    }
}
