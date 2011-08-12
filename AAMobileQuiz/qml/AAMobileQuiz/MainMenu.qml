import QtQuick 1.0

Column {
    signal selectAction(string actionName)

    spacing: 30

    Text {
        text: "What do you want to do?"
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        width: parent.width
        wrapMode: Text.WordWrap
        font.pointSize: 14
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        buttonText: "Flash Cards"
        onButtonClicked: {
            selectAction("flash")
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        buttonText: "Multiple Choice"
        onButtonClicked: {
            selectAction("multi")
        }
    }

    Button {
        anchors.horizontalCenter: parent.horizontalCenter
        buttonText: "Quit Application"
        onButtonClicked: {
            selectAction("quit")
        }
    }
}
