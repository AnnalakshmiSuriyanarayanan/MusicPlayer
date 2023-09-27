import QtQuick 2.15
import QtQuick.Controls 2.0

Item {
    StackView{
        id: stack1
        anchors.fill: parent
        initialItem: "SecondPage.qml"
        visible: false
    }
}
