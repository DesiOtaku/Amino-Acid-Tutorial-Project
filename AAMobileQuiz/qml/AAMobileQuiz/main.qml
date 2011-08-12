import QtQuick 1.0

Rectangle {
    id: rootMenu
    width: 360
    height: 360

    Loader {
        id: screenLoader

        anchors.fill: parent
        sourceComponent: mainMenuComp

        function loadNewComp(newCompToUse) {
            newScreenAni.newComp = newCompToUse
            newScreenAni.start();
        }

        SequentialAnimation {
            id: newScreenAni
            property variant newComp;

            ParallelAnimation {
                NumberAnimation  {
                    target: screenLoader
                    property: "scale"
                    from: 1
                    to: 0
                    duration: 1000
                }
                NumberAnimation  {
                    target: screenLoader
                    property: "rotation"
                    from: 0
                    to: 360
                    duration: 1000
                }
            }
            ScriptAction {
                script: screenLoader.sourceComponent = newScreenAni.newComp;
            }
            ParallelAnimation {
                NumberAnimation  {
                    target: screenLoader
                    property: "scale"
                    from: 0
                    to: 1
                    duration: 1000
                }
                NumberAnimation  {
                    target: screenLoader
                    property: "rotation"
                    from: 360
                    to: 0
                    duration: 1000
                }
            }
        }

    }

    Component {
        id: mainMenuComp
        MainMenu {
            onSelectAction: {
                if(actionName == "flash") {
                    screenLoader.loadNewComp(flashComp);
                }
            }
        }
    }

    Component {
        id: flashComp
        FlashCardsView {

        }
    }



}
