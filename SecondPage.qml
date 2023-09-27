import QtQuick 2.15
import QtQuick.Controls
import QtMultimedia

Item {
    property bool playState: false

    property int songIndex: -1 // Set this to the currently playing song index


    property var songPaths: [
        { title: "Song 1", artist: "Artist 1", source: "Virumandi.mp3",name:"Virumandi.mp3" },
        { title: "Song 2", artist: "Artist 2", source: "geetha.mp3",name:"Virumandi.mp3" },
        { title: "Song 3", artist: "Artist 3", source: "Yuvan.mp3" ,name:"Virumandi.mp3"},
        { title: "Song 4", artist: "Artist 4", source: "vaali.mp3",name:"Virumandi.mp3" },
        { title: "Song 5", artist: "Artist 5", source: "Ilayaraja.mp3",name:"Virumandi.mp3" },
        { title: "Song 6", artist: "Artist 6", source: "Vannarapettaiyilla.mp3",name:"Virumandi.mp3" }
    ]
    property var songImages: [
        "images/virumandi.jpg",
        "images/geetha.jpg",
        "images/yaaradi.jpg",
        "images/vaali.jpg",
        "images/ilaiyaraja.jpg",
        "images/Vannarapettaiyila.jpg",

    ]

    Row{
        TabButton {
            width: 640
            height: 40
            y: 35
            Text {
                text: "USB Music"
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 25
            }
            background: Rectangle {
                color: "darkslateblue"
            }
        }

        TabButton {
            width: 79
            height: 40
            x: 300
            y: 35
            Text {
                text: " List"
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 25
                visible: true
            }
            background: Rectangle {
                color: "slateblue"
            }
        }
    }


    ListModel {
        id: songListModel
        ListElement { title: "Song 1"; artist: "Artist 1"; source: "Virumandi.mp3" ;name:"Virumandi.mp3"}
        ListElement { title: "Song 2"; artist: "Artist 2"; source: "geetha.mp3" ;name:"geetha.mp3"}
        ListElement { title: "Song 3"; artist: "Artist 3"; source: "Yuvan.mp3";name:"Yuvanism.mp3" }
        ListElement { title: "Song 4"; artist: "Artist 4"; source: "vaali.mp3";name:"Vaali-Ajith.mp3" }
        ListElement { title: "Song 5"; artist: "Artist 5"; source: "Ilayaraja.mp3";name:"Ilaiyaraja.mp3" }
        ListElement { title: "Song 6"; artist: "Artist 6"; source: "Vannarapettaiyilla.mp3" ;name:"Maaveran_SK.mp3"}

    }

    ListView {
        y: 80
        anchors.left: parent.left
        width: 280
        height: 360
        clip: true
        model: songListModel
        spacing: 1


        delegate: Rectangle {
            width: parent.width
            height: 60
            clip: true

            color: (index === songIndex) ? "lightblue" : "black"

            Text {
                anchors.centerIn: parent
                text: title
                font.pixelSize: 18
                color: "white"
            }


            MouseArea {
                anchors.fill: parent
                onClicked: {
                    songIndex = index; // Update the current song index when clicked
                    playSong(model.source);
                    centext1.visible=true
                    centext2.visible=true
                    songImage.visible=true
                    //flowText.visible=true
                    //viewList.running = true


                }
                //                onDoubleClicked: {
                //                    mediaPlayer.stop()
                //                    centext1.visible=false
                //                    centext2.visible=false
                //                    songImage.visible=false
                //                    playImg.visible=true
                //                }
            }
        }
    }
//    Viewlist{
//        id: viewList
//    }
    Rectangle{
        id: flowRect
        width: 250
        height: 60
        x: 290
        y: 130
        clip:true
        gradient: Gradient{
            GradientStop { position: 0.2; color: "black" }
            GradientStop { position: 0.9; color: "darkslateblue" }
            GradientStop { position: 0.1; color: "black" }

        }

        Text {
            id: flowText
            text: "I love music and the songs can chill our mind"
            color: "White"
//                x: 350
//                y: 140
            anchors.centerIn: flowRect.Center
            clip:true
            font.pixelSize: 25

            NumberAnimation on x {
                target: flowText
                property: "x"
                to: -100; duration: 3000
                loops: Animation.Infinite
                running: true
            }
        }

    }


    Text{
        id: centext1
        text: "No artist information"
        font.pixelSize: 15
        color: "white"
        x: 300
        visible: false
        y: 220

    }

    Text{
        id: centext2
        text: "No album information"
        font.pixelSize: 15
        color: "grey"
        x: 300
        visible: false
        y: 240

    }



    MediaPlayer {
        id: mediaPlayer
        audioOutput: AudioOutput{}

        onPlaybackStateChanged: {
            console.log("Playback state changed:", mediaPlayer.playbackState)
        }
    }

    Slider {
        id: progressSlider
        width: 340
        height: 20
        x: 330
        y: 390

        enabled: mediaPlayer.seekable
        value: mediaPlayer.duration > 0 ? mediaPlayer.position / mediaPlayer.duration : 0
        background: Rectangle {
            implicitHeight: 8
            color: "transparent"
            Rectangle {
                width: progressSlider.visualPosition * parent.width
                height: parent.height
                gradient:Gradient{
                    orientation: Qt.Horizontal
                    GradientStop{position: 0.3; color: "gray"}
                    GradientStop{position: 0.5; color: "blue"}
                    GradientStop{position: 1.0; color: "purple"}
                }
            }
        }
        handle: Item {}
        onMoved: function () {
            mediaPlayer.position = mediaPlayer.duration * progressSlider.position
        }
    }

    function msToTime(duration)
    {
        var minutes= parseInt(duration/(1000*60)%60);
        var seconds=parseInt((duration/1000)%60);
        minutes=(minutes<10)?"0"+minutes:minutes;
        seconds=(seconds<10)?"0"+seconds:seconds;
        return minutes+":"+seconds;
    }
    Text{
        id: text1
        x: 290
        y: 390
        color: "white"
        font.bold: true
        text: msToTime(mediaPlayer.position)

    }
    Text{
        id: text2
        x: 680
        y: 390
        color: "white"
        font.bold: true
        text: msToTime(mediaPlayer.duration)
    }

    Image {
        id: songImage
        width: 100
        height: 100
        source: songImages[songIndex]
        //anchors.horizontalCenter: parent.horizontalCenter
        y: 200
        x: 625

    }

    Image{
        id: playImg
        x: 480
        y: 321
        source: "images/play.png"
        width: 40
        height: 40

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            onClicked: {
                if (playState === true) {
                    mediaPlayer.play()
                    playImg.source = "images/pause1.png"
                    playState = true
                } else {
                    mediaPlayer.pause()
                    playImg.source = "images/play.png"
                    playState = false
                }
                playState = !playState
            }
        }

    }
    Image{
        id: prevImg
        x: 400
        y: 323
        source: "images/previous.png"
        width: 35
        height: 35


        MouseArea {
            id: mousearea1
            anchors.fill: parent

            onClicked: {
                songIndex = (songIndex - 1 + songPaths.length) % songPaths.length
                mediaPlayer.stop()
                mediaPlayer.source = songPaths[songIndex]
                mediaPlayer.play()
                playImg.source = "images/pause1.png"
                playState = true
                songImage.source = songImages[songIndex]

            }
        }
    }
    Image{
        id: nxtImg
        x: 570
        y: 323
        source: "images/previous.png"
        width: 35
        rotation: 180
        height: 35

        MouseArea {
            id: mousearea2
            anchors.fill: parent

            onClicked: {
                songIndex = (songIndex + 1) % songPaths.length
                mediaPlayer.stop()
                mediaPlayer.source = songPaths[songIndex]
                mediaPlayer.play()
                playImg.source = "images/pause1.png"
                playState = true
                songImage.source = songImages[songIndex]

            }
        }
    }

    function playSong(songSource) {
        // If the same song is clicked again, pause or resume it
        if (mediaPlayer.source === songSource) {
            if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                mediaPlayer.pause();
            } else if (mediaPlayer.playbackState === MediaPlayer.PausedState) {
                mediaPlayer.play();
            }
        } else {
            // If a new song is clicked, stop the current song and play the new one
            for (var i = 0; i < songPaths.length; i++) {
                if (songPaths[i].source === songSource) {
                    // Set the selected song as the mediaPlayer.source
                    mediaPlayer.source = songSource;
                    mediaPlayer.play();
                    songIndex = i; // Update the current song index
                    songImage.source = songImages[songIndex]; // Update the song image
                    playImg.source = "images/pause1.png"; // Update the play/pause button image
                    playState = true;
                    break;
                }
            }
        }
    }

    function pauseSong() {
        mediaPlayer.pause();
    }

    function stopSong() {
        mediaPlayer.stop();
    }

}


