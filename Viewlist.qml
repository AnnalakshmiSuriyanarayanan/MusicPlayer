import QtQuick 2.15

Item {
    id: viewList
    property int songIndex: -1 // Set this to the currently playing song index

    property var names: [{name:"Virumandi.mp3"},
         { name:"geetha.mp3"},
         { name:"Yuvanism.mp3"},
         { name:"Vaali-Ajith.mp3"},
         { name:"Ilaiyaraja.mp3"},
         { name:"Maaveran-SK.mp3"}]
    ListModel{
        id: model1
        ListElement { name:"Virumandi.mp3"}
        ListElement { name:"geetha.mp3"}
        ListElement { name:"Yuvanism.mp3"}
        ListElement { name:"Vaali-Ajith.mp3"}
        ListElement { name:"Ilaiyaraja.mp3"}
        ListElement { name:"Maaveran-SK.mp3"}


    }
    ListView {
//        y: 180
//        anchors.left: parent.left
        width: 250
        height: 100
//        clip: true
        model: model1
        //spacing: 1
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
                text: "the song names are"
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
    }
}
