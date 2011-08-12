import QtQuick 1.0

Rectangle {
    signal done

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
        /*anchors.top: parent.top
        anchors.bottom: actionRow.top
        anchors.left: parent.left
        anchors.right: parent.right*/
        anchors.fill: parent
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
            source: "home.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true

            MouseArea {
                anchors.fill: parent
                onClicked: done();
            }
        }
        /*Image {
            height: parent.height
            width: parent.height
            source: "previous.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true
        }
        Image {
            height: parent.height
            width: parent.height
            source: "next.svg"
            sourceSize.height: height
            sourceSize.width: width
            smooth: true
        }*/
    }
}
