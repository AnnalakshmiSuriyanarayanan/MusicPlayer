import QtQuick 2.15
import QtQuick.Controls


Item {
    id: nxt
    property bool imageOpened: false

    Button {

        background: Rectangle {
            color: "darkslateblue"

            width: 39
            height: 30
        }

        onClicked: {
            stack1.pop()
        }

        text: "←"
        font.bold: true
        font.pixelSize: 25


    }
    TabButton {
        x:40
        width: 47
        Text {
            text: "Menu"
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: 15
            font.bold: true
        }
        onClicked: {
            if (!imageOpened) {
                img1.visible = true;
                imageOpened = true;
            }
            else if(imageOpened){
                img1.visible=true;
                imageOpened=true;
            }
        }
        background: Rectangle {
            color: "darkslateblue"
        }
        height: 30
    }
    Image{
        id: img1
        width: 50
        height: 50
        visible: false
        x: 280
        y: 230
        fillMode: Image.PreserveAspectFit
        source:"images/music.png"

        MouseArea{
            id: mouse1
            anchors.fill: parent
            onClicked:{
                stack1.visible=true
                img1.visible=false
                stack1.push("SecondPage.qml")
            }
        }
    }
}
