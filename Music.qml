import QtQuick 2.15
import QtMultimedia
import QtQuick.Controls 2.0

Item {
    property var songPaths: [
        "Virumandi.mp3",
        "jd.mp3",
        "kavithaiye.mp3",
        "vaali.mp3",
        "Vannarapettaiyilla.mp3",

    ]

    property int currentSongIndex: 0
    property bool playState: false

    function msToTime(duration) {
        var seconds = parseInt((duration / 1000) % 60)
        var minutes = parseInt((duration / (1000 * 60)) % 60)

        minutes = (minutes < 10) ? "0" + minutes : minutes
        seconds = (seconds < 10) ? "0" + seconds : seconds

        return minutes + ":" + seconds
    }

    MediaPlayer {
        id: musicPlayer
        source: songPaths[currentSongIndex]
        audioOutput: AudioOutput {}
    }



    Slider {
        id: myslider
        width: 300
        x: 75
        y: 320
        value: musicPlayer.duration > 0 ? musicPlayer.position / musicPlayer.duration : 0

        onMoved: {
            musicPlayer.position = musicPlayer.duration * myslider.position
        }
    }

    Text {
        id: te
        font.pointSize: 10
        font.bold: true
        x: 37
        y: 320
        color: "white"
        text: msToTime(musicPlayer.position)
    }

    Text {
        id: te1
        font.bold: true
        font.pointSize: 10
        x: 380
        y: 320
        color: "white"

        text: msToTime(musicPlayer.duration)
    }

    Text {
        id: songNameText
        text: songPaths[currentSongIndex].split(".")[0]
        font.pointSize: 12
        font.bold: true
        anchors.horizontalCenter: parent.horizontalCenter
        y: 300

    }



    Image {
        id: play
        width: 50
        height: 50
        source: "images/play.png"
        x: 200
        y: 350

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            onClicked: {
                if (playState === false) {
                    musicPlayer.play()
                    play.source = "images/pause.png"
                    playState = true
                } else {
                    musicPlayer.pause()
                    play.source = "images/play.png"
                    playState = false
                }
            }
        }
    }

    Image {
        id: previous
        width: 50
        height: 50
        y: 350
        x: 100
        source: "images/previous.png"

        MouseArea {
            id: mousearea1
            anchors.fill: parent

            onClicked: {
                currentSongIndex = (currentSongIndex - 1 + songPaths.length) % songPaths.length
                musicPlayer.stop()
                musicPlayer.source = songPaths[currentSongIndex]
                musicPlayer.play()
                play.source = "images/pause.png"
                playState = true
                //songNameText.text = songPaths[currentSongIndex].split(".")[0]
                //songImage.source = songImages[currentSongIndex]
            }
        }
    }

    Image {
        id: next
        width: 50
        height: 50
        y: 350
        x: 310
        source: "images/next.png"

        MouseArea {
            id: mousearea2
            anchors.fill: parent

            onClicked: {
                currentSongIndex = (currentSongIndex + 1) % songPaths.length
                musicPlayer.stop()
                musicPlayer.source = songPaths[currentSongIndex]
                musicPlayer.play()
                play.source = "images/pause.png"
                playState = true
                //songNameText.text = songPaths[currentSongIndex].split(".")[0]
                //songImage.source = songImages[currentSongIndex]
            }
        }
    }
}





