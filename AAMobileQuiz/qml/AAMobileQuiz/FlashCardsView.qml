import QtQuick 1.0

Rectangle {
    id: rootFlashView
    signal done
    property bool defaultFlipped: false
    property bool shuffleMode: false

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

    ListModel {
        id: shuffleModel

        function doTheTruffleShuffle() { //called this since this shuffle is rather ineloquent
            clear();
            for(var i=0;i< kvtmlModel.count;i++) { //first pull all the data
                append({"aaName": kvtmlModel.get(i).aaName, "aaImage": kvtmlModel.get(i).aaImage});
            }
            for(var s=0;s< kvtmlModel.count;s++) {  //now throw data to various locations
                var randomFrom = Math.floor( (Math.random() * shuffleModel.count) - 1 );
                var randomTo = Math.floor( (Math.random() * shuffleModel.count) - 1 );
                move(randomFrom,randomTo,1);
            }
        }
    }

    ListView {
        id: cardList
        model: shuffleMode ? shuffleModel : kvtmlModel
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

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    rootFlashView.shuffleMode = !rootFlashView.shuffleMode;
                    if(rootFlashView.shuffleMode) {
                        shuffleModel.doTheTruffleShuffle();
                    }
                }
            }
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
