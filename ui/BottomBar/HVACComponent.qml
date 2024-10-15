import QtQuick 2.15

 Item {
    property string fontColor: "#f0eded"
    property var hvacController


    Rectangle {
        id: decreamentButton
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
        width: height / 2
        color: "black"

        Text {
            id: decrementText
            anchors.centerIn:  parent
            text: "<"
            font.pixelSize: 12
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            onClicked: hvacController.incrementTargetTemperature( -1 )
        }
    }

    Text {
        id: targetTemperatureText
        anchors {
            left: decreamentButton.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        text: hvacController.targetTemperature
        font.pixelSize: 24
        color: fontColor
    }


    Rectangle {
        id: increamentButton
        anchors {
            top: parent.top
            left: targetTemperatureText.right
            bottom: parent.bottom
            leftMargin: 15
        }
        width: height / 2
        color: "black"

        Text {
            id: incrementText
            anchors.centerIn:  parent
            text: ">"
            font.pixelSize: 12
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            onClicked: hvacController.incrementTargetTemperature( 1 )
        }
    }


}
