import QtQuick 1.0

Rectangle {
    id: rootFlashView
    signal done
    property bool defaultFlipped: false

    XmlListModel {
        id: kvtmlModel
        source: "aa.kvtml"
        query: "/kvtml/entries/entry"

        XmlRole {
            name: "aaName"
            query: "translation/text/string()"
        }
        XmlRole {
            name: "aaImage"
            query: "translation/image/string()"
        }
    }

    ListView {
        id: cardList
        model: kvtmlModel
        delegate: cardComp;
        snapMode: ListView.SnapOneItem
        anchors.fill: parent
        orientation: ListView.Horizontal
    }

    Component {
        id: cardComp
        FlashCard {
            text: aaName
            imgSrc: aaImage
            width: rootFlashView.width
            height: rootFlashView.height
            flipped: rootFlashView.defaultFlipped
        }
    }

    Row {
        id: actionRow
        height: 64
        opacity: cardList.moving
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            height: parent.height
            width: parent.height
            source: "home.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true

            MouseArea {
                anchors.fill: parent
                onClicked: done();
            }
        }
        Image {
            height: parent.height
            width: parent.height
            source: "shuffle.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true
        }
        Image {
            height: parent.height
            width: parent.height
            source: "link.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true
            MouseArea {
                anchors.fill: parent
                onClicked: rootFlashView.defaultFlipped = !rootFlashView.defaultFlipped
            }
        }

        Behavior on opacity {
            NumberAnimation { duration: 5000; easing.type: Easing.OutExpo }
        }
    }
}
