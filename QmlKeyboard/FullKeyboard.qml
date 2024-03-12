import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import HeaderService 1.0
import ScreenService 1.0

import KeyboardService 1.0
import "../widgets"
import "../header"
import "../screenComponents"
import "../QmlKeyboard"

Item{
    id:root
    property int role:1
    property alias process:processor
    KeyboardInputProcessor{
        id:processor
        role:root.role
    }
    state:"en"
    property var model:"q w e r t y u i o p a s d f g h j k l # z x c v b n m Shift Space acc close back Switch".split(" ")
    states:[
        State{
            name:"en upper"
            PropertyChanges{
                target:loader
                sourceComponent:component_wifiKeyboardEn
            }
            PropertyChanges{
                target:root
                model:"Q W E R T Y U I O P A S D F G H J K L # Z X C V B N M Shift Space acc close back Switch".split(" ")

            }
        },
        State{
            name:"en"
            PropertyChanges{
                target:loader
                sourceComponent:component_wifiKeyboardEn
            }
            PropertyChanges{
                target:root
                model:"q w e r t y u i o p a s d f g h j k l # z x c v b n m Shift Space acc close back Switch".split(" ")
            }
        },
        State{
            name:"ru"
            PropertyChanges{
                target:loader
                sourceComponent:component_wifikeyboardRu
            }
            PropertyChanges{
                target:root
                model:"й ц у к е н г ш щ з х ъ ф ы в а п р о л д ж э # я ч с м и т ь б ю Shift Space acc close back Switch".split(" ")
            }
        },
        State{
            name:"special"
            PropertyChanges{
                target:loader
                sourceComponent:component_wifiKeyboardDigit
            }
        },
        State{
            name:"ru upper"
            PropertyChanges{
                target:loader
                sourceComponent:component_wifikeyboardRu
                }
            PropertyChanges{
                target:root
                model:"Й Ц У К Е Н Г Ш Щ З Х Ъ Ф Ы В А П Р О Л Д Ж Э # Я Ч С М И Т Ь Б Ю Shift Space acc close Switch".split(" ")
            }


        }
    ]

    Loader {
        id: loader
        anchors.fill: parent
        sourceComponent: component_wifiKeyboardDigit
    }

    Component {
        id: component_wifikeyboardRu
        Item{
            id:wifiKeyboardRu

            property var model:root.model
            GridLayout{
                columns:12
                anchors.fill: parent
                Repeater{

                    model:wifiKeyboardRu.model
                    delegate:TextBtn{
                        text:{
                            if(modelData==="#"){
                                return ""
                            }else return modelData
                        }
                        onClicked:{
                            if(modelData==="Switch"){
                                root.state="special"
                            }
                            else if(modelData==="Shift"){
                                if(root.state==="ru upper"){
                                    root.state="ru"
                                }
                                else{
                                    root.state="ru upper"
                                }

                            }
                            else{
                                processor.process(modelData)
                            }
                        }
                        enabled:!(modelData==="#")
                        color: (modelData==="#")? backgroundColor : (morea.containsPress)? clickColor:normalColor
                        Layout.columnSpan: {
                            if(modelData==="Shift")return 3
                            else if(modelData==="Space") return 3
                            else if(modelData==="acc") return 2
                            else if(modelData==="Switch") return 3
                            else if(modelData==="close") return 2
                            else if(modelData==="back") return 2
                            
                            else  return 1
                        }
                    }
                }
            }
        }
    }
    Component{
        id:component_wifiKeyboardDigit
        Item{
            GridLayout{
                columns:11
                anchors.fill: parent
                Repeater{
                    model:"1 2 3 4 5 6 7 8 9 0 ~ ` ! @ # $ % ^ & * ( ) _ - + = { [ } ] | \\ : ; \" ' < , > . ? / acc close back Switch".split(" ")
                    delegate:TextBtn{
                        onClicked:{
                            if(modelData==="Switch"){
                                root.state="en"
                            }
                            else{
                                processor.process(modelData)
                            }
                        }

                        text:modelData
                        Layout.columnSpan: {
                            if(modelData==="Shift")return 3
                            else if(modelData==="Space") return 4
                            else if(modelData==="acc") return 3
                            else if(modelData==="Switch") return 3
                            else if(modelData==="close") return 2
                            else if(modelData==="back") return 3
                            
                            else  return 1
                        }
                    }
                    
                }
            }
            
        }
        
    }
    Component{
        id:component_wifiKeyboardEn
        WifiKeyboardEn{
            id:wifikeyboardEn
            model:root.model
            onKeyPressed: (a)=>{
                            if(a==="Switch"){
                                root.state="ru"
                              }
                              else if(a==="Shift"){
                                  if(root.state==="en"){
                                    root.state="en upper"
                                  }
                                  else{
                                    root.state="en"
                                  }

                              }
                              else{
                                processor.process(a)
                              }
                                }
        }
    }
    
}
