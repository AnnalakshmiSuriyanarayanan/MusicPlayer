import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    anchors.fill: parent
    StackView{
        id: stack1
        anchors.fill: parent
        initialItem: "NextFile.qml"
//        visible: false
    }
}
