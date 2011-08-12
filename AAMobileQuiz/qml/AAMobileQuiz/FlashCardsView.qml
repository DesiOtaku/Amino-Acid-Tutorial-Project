import QtQuick 1.0

Rectangle {

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
        model: kvtmlModel
        delegate: cardComp;
        anchors.top: parent.top
        anchors.bottom: actionRow.top
        anchors.left: parent.left
        anchors.right: parent.right
        clip: true
        orientation: ListView.Horizontal
    }

    Component {
        id: cardComp
        FlashCard {
            text: aaName
            imgSrc: aaImage
        }
    }

    Row {
        id: actionRow
        height: 64
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        Image {
            height: parent.height
            width: parent.height
            source: "ok.png"
        }
        Image {
            height: parent.height
            width: parent.height
            source: "back.png"
        }
        Image {
            height: parent.height
            width: parent.height
            source: "next.png"
        }
    }
}
