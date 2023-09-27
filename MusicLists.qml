import QtQuick 2.15

Item {
    property int songIndex: 0

    ListView {
        anchors.left: parent.left
        width: parent.width
        height: parent.height
        model: songListModel

        delegate: Rectangle {
            width: parent.width
            height: 40
            color: (index === songIndex) ? "lightblue" : "green"

            Text {
                anchors.centerIn: parent
                text: title + " - " + artist
                font.pixelSize: 18
                color: (index === songIndex) ? "yellow" : "red"
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    songIndex = index; // Update the current song index when clicked
                }
            }
        }
    }
    ListModel {
        id: songListModel
        ListElement { title: "Song 1"; artist: "Artist 1" }
        ListElement { title: "Song 2"; artist: "Artist 2" }
        ListElement { title: "Song 3"; artist: "Artist 3" }
        // Add more songs as needed
    }




}
