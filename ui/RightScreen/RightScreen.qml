import QtQuick 2.15

Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right:  parent.right
    }
    width: parent.width * 2/3
    color: "orange"
}
