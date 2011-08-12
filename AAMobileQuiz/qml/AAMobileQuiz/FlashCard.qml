import QtQuick 1.0

Flipable {
    id: flipable

    property bool flipped: false
    property alias text:textFront.text
    property alias imgSrc: imgBack.source

    property int anchorSpace: 10

    width: parent.height
    height: parent.height

    front: Rectangle {
        radius: 3
        smooth: true
        border.color: "#AAA"
        border.width: 3
        anchors.fill: parent
        anchors.margins: anchorSpace
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#BBB"
            }
            GradientStop {
                position: 1
                color: "#FFF"
            }
        }

        Text {
            id: textFront
            font.pointSize: 14
            anchors.centerIn: parent
        }
    }

    back: Rectangle {
        radius: 3
        smooth: true
        border.color: "#AAA"
        border.width: 3
        anchors.fill: parent
        anchors.margins: anchorSpace

        Image {
                id: imgBack
                anchors.fill: parent
                fillMode: Image.PreserveAspectFit
                smooth: true
                anchors.margins: anchorSpace
            }
    }

    transform: Rotation {
        id: rotation
        origin.x: flipable.width/2
        origin.y: flipable.height/2
        axis.x: 0; axis.y: 1; axis.z: 0     // set axis.y to 1 to rotate around y-axis
        angle: 0    // the default angle
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 1000 }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: flipable.flipped = !flipable.flipped
    }
}
