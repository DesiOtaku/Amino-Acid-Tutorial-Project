import QtQuick 1.0

Rectangle {
    id: rootButton
    property alias buttonText: textElement.text
    signal buttonClicked

    width:textElement.width + 10
    height: textElement.height + 10
    radius: 5
    border.color: "green"
    border.width: 2
    smooth: true
    gradient:defaultGrad

    Gradient {
        id: defaultGrad
        GradientStop {
            color: "lightgreen"
            position: 0.0
        }
        GradientStop {
            color: "darkgreen"
            position: 1.0
        }
    }

    Gradient {
        id: selectGrad
        GradientStop {
            color: "lightblue"
            position: 0.0
        }
        GradientStop {
            color: "darkblue"
            position: 1.0
        }
    }


    Text {
        id: textElement
        font.pointSize: 12
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onPressed: {
            rootButton.gradient = selectGrad
        }
        onReleased: {
            rootButton.gradient = defaultGrad
        }

        onClicked: {
            rootButton.buttonClicked();
        }


    }
}
