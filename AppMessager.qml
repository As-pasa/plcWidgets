import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "virtualKeyboards/"
Item{
    id:messager2
    Text{
        anchors.fill: parent
        text:messager.message
    }
}
