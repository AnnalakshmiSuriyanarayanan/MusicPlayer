import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls
import QtMultimedia


ApplicationWindow {
    id: window
    width: 720
    height: 450
    visible: true
    title: qsTr("Hello World")
    property int songIndex: 0
    property bool imageOpened: false

    Rectangle{
        id: grad1
        anchors.fill: parent
        gradient: Gradient{
            GradientStop { position: 0.2; color: "black" }
            GradientStop { position: 0.4; color: "darkslateblue" }
            GradientStop { position: 0.8; color: "black" }
        }
    }
    Row{
        spacing: 20
        x: 230
        y: 10
        Text{
            id: timedisplay
            font.bold: true
            font.pixelSize: 18
            color: "white"
            font.family: "Times New Roman"
            text: systemHandler.currentTime
        }

        Text {
            text: systemHandler.currentDate.toDateString(Qt.ISODate)
            font.pixelSize: 18
            color: "white"
            font.family: "Times new roman"
        }
        Text{
            id: userName
            x: 100
            font.bold: true
            font.pixelSize: 18
            color: "white"
            text: systemHandler.userName
        }
    }
    Image{
        id: logo
        y: 70
        x: 500
        source: "images/logo1.png"
        width: 75
        height: 75
    }

    NextFile{
    }

    StackView{
        id: stack1
        anchors.fill: parent
        initialItem: "NextFile.qml"
    }
    Viewlist{
        id: viewlist
        visible: false
    }
}


