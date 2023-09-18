import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Layouts 1.12
Item{
    id:root
    width: 800
    height: 400

    signal leftClicked()
    signal rightClicked()
    signal centerClicked()

    property string leftImagePath: "qrc:/plkLanguage.png"
    property string centerImagePath: "qrc:/plkLanguage.png"
    property string rightImagePath: "qrc:/plkLanguage.png"

    property string leftText: "Сеть"
    property string centerText: "Настройки"
    property string rightText: "Резервное копирование"

    property string screenName: "version 1.3"
    RowLayout{
        anchors.fill: parent
        MenuTile{
            imageSource: root.leftImagePath
            text: root.leftText
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 5
            onClick : {
                root.onLeftClicked()
            }
        }
        MenuTile{
            imageSource: root.centerImagePath
            text: root.centerText
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 5
            onClick:{
                root.onCenterClicked()
            }
        }
        MenuTile{
            imageSource: root.rightImagePath
            text: root.rightText
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.margins: 5
            onClick:{
                root.onRightClicked()
            }
        }
    }
}
