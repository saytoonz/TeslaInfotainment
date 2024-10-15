import QtQuick 2.15
import QtPositioning
import QtLocation


Rectangle {
    id: rightScreen
    anchors {
        top: parent.top
        bottom: bottomBar.top
        right:  parent.right
    }
    width: parent.width * 2/3

    Plugin {
        id: mapPlugin
        name: "osm"
    }

    Map {
        id: map
        anchors.fill: parent
        plugin: mapPlugin
        center: QtPositioning.coordinate(5.550, -0.200) // Accra
        zoomLevel: 14
        property geoCoordinate startCentroid

        PinchHandler {
            id: pinch
            target: null
            onActiveChanged: if (active) {
                                 map.startCentroid = map.toCoordinate(pinch.centroid.position, false)
                             }
            onScaleChanged: (delta) => {
                                map.zoomLevel += Math.log2(delta)
                                map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                            }
            onRotationChanged: (delta) => {
                                   map.bearing -= delta
                                   map.alignCoordinateToPoint(map.startCentroid, pinch.centroid.position)
                               }
            grabPermissions: PointerHandler.TakeOverForbidden
        }
        WheelHandler {
            id: wheel
            // workaround for QTBUG-87646 / QTBUG-112394 / QTBUG-112432:
            // Magic Mouse pretends to be a trackpad but doesn't work with PinchHandler
            // and we don't yet distinguish mice and trackpads on Wayland either
            acceptedDevices: Qt.platform.pluginName === "cocoa" || Qt.platform.pluginName === "wayland"
                             ? PointerDevice.Mouse | PointerDevice.TouchPad
                             : PointerDevice.Mouse
            rotationScale: 1/120
            property: "zoomLevel"
        }
        DragHandler {
            id: drag
            target: null
            onTranslationChanged: (delta) => map.pan(-delta.x, -delta.y)
        }
        Shortcut {
            enabled: map.zoomLevel < map.maximumZoomLevel
            sequence: StandardKey.ZoomIn
            onActivated: map.zoomLevel = Math.round(map.zoomLevel + 1)
        }
        Shortcut {
            enabled: map.zoomLevel > map.minimumZoomLevel
            sequence: StandardKey.ZoomOut
            onActivated: map.zoomLevel = Math.round(map.zoomLevel - 1)
        }
    }

    Image {
        id: lockIcon
        anchors {
            left: parent.left
            top: parent.top
            margins: 20
        }
        width: parent.width / 40
        fillMode: Image.PreserveAspectFit
        source: {
            systemHandler.carLocked ?
                        "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAABYgAAAWIBXyfQUwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAJ2SURBVHic7Zq9btRAFIW/UKyJBIEKFJICxJZIUPEAdEjUSIiIB4CQElGngTdYkbTwCAho6MJPwV9QSrQoQkh0IesUoQnFeBtje8eeuz5eMZ90G6/3zLnH//bM0R4ngRvANeAycB44nf22BwyBL8Br4DkwatHbVFkEBsABcORZB8Am0Bf4NWMeWAdS/BvP1x/gMZC07D2YPrBN88bztQWcbbWDAK4Av7Brfly7wCVrs3PGen3c1jpTsc5v4AWwA/zIli3jmrsOLFT8dxe4igu4c8xTvdsPgdtAr0KjB6wA3yt0tujoOWGdctMD6pk+DmxU6D0yc23EIuVn+wcBug9LNA+BiwG65gwo3/KhlO0JGwbaJixQfJMzxOZY7QHfCvRT4ISBfjC3KN5CK4Zj3CkZ46bhGI3Z5F9je1Sf7euS4C6f+XGehAofCxXAPdjkeYm7jbXiEHjlOXYtLAK4ULDsq4Funm3PsWthEUDRndtPA10fzVOhohYBFB3rqYFunqL3A8FXGYsAZpoYgNqAmhiA2oCaGIDawCyRAPeBd4S96Z1WpZm3VWyfQwBYAj53oEnf+pR5NiGZsebH9RGjPWGtA800rXsWAbzvQCNN6+2k5ny+C4zoyKunBqS4j7Kl+ARwZONFRmWP//19QAxAbUBNDEBtQE0MQG1ATQxAbUBNDEBtQE0MQG1ATQxAbUBNDEBtQE0MQG1ATQxAbUBNDEBtQE0MQG1ATQxAbUCNTwDTmPXZFvuTVvAJYMfAiIqJ3n0CeGZgRMVTC5EEN+dGPdmhbn3AcLLUEm7OjbqpOs2fs2p+TA835+YNbtaIusl8jTJvd6mx5f8C60shr+GNAdEAAAAASUVORK5CYII="
                      : "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAePQAAHj0BGTAjgAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAKTSURBVHic7ZtBaxNRFIW/1za7ClakVWkV/4A7dwoWEUVEXCgiuBG3IogUF4r+CDduRQQX4kIFQUUXulNBsmpFg4KKOxdVjDbtdTFJKzHh3cQZz6R9By4hnddzz/0mk2km02BmlF0hhE3ACWA3MAVMAmPAZ+Aj8B64C9wzs589mZtZaQvYAzwAGoA56itwDZh091AP2WXwCeCGc+hONQ+cB0YGDgAw3dyT/Q7/Z70AxgcGAHAYqOc0fKvmgKnSAwCOAAs5D9+qD8DmTn1Ds7lUIYRtwGtgfYFtHgH7rW3goQIbuhRCGAZuUuzwAPuAc3/9tAQv/TMU87LvVHXa3g+kh0AIoQK8I/vjxqNXwEPgOVADdgK7gEPAFqfHVTM7u/xMvPdP4dtzi8BFyHZYB58NwH2n1w9gohRnAeClI/A8sNfhFYDLTgiX5ACAjcCSI+xMj75PHZ7PygDguCPoLFDp0XcH8c8Ov4BRM5OeBqcda2bMbKEXUzOrAtcjyypkb55SANsj2w140qf3Y29/JYDxyPaamX3v07vq7V9mAJ4hummO7DiP9lcCGItsf9uvsZk1yD4ARfsrAcR6L/2jf+z3hzwhVr0SAHUAtRIAdQC1EgB1ALUSAHUAtdY8gNZFhGHgAtm3rPX/VLGLIY229VXgZA8XRmYj/reWrwgBBxyBylCLwNY8AbQOgaMMhoaAY3kajjQfR/M0LVjrnOtqke2fYAXAqpOZHfSsW/NngQRAHUCtBEAdQK0EQB1ArQRAHUCtBEAdQK0EQB1ArQRAHUCtBEAdQK0EQB1ArQRAHUCtBEAdQK0EQB1ArQSg+djvTckKfcvTrAXgTp6mBcqA2/k6rtwgcQX4gv4egG71Bjid93+u/AbUyPnhzaAQVQAAAABJRU5ErkJggg=="
        }
        MouseArea {
            anchors.fill: parent
            onClicked: systemHandler.setCarLocked( !systemHandler.carLocked )
        }
    }

    Text {
        id: dateTimeDisplay
        anchors {
            left: lockIcon.right
            bottom: lockIcon.bottom
            leftMargin: 40
        }
        font.pixelSize: 14
        font.bold:  true
        color: "black"

        text: systemHandler.currentTime

    }

    Text {
        id: outdoorTemperatureDisplay
        anchors {
            left: dateTimeDisplay.right
            bottom: lockIcon.bottom
            leftMargin: 40
        }
        font.pixelSize: 14
        font.bold:  true
        color: "black"

        text: systemHandler.outdoorTemp + "°F"

    }

    Image {
        id: userNameIcon
        anchors {
            left: outdoorTemperatureDisplay.right
            bottom: lockIcon.bottom
            leftMargin: 40
        }
        width: parent.width / 50
        fillMode: Image.PreserveAspectFit
        source: "data:image/png;base64,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"
    }

    Text {
        id: userNameDisplay
        anchors {
            left: userNameIcon.right
            bottom: lockIcon.bottom
            leftMargin: 5
        }
        font.pixelSize: 14
        font.bold:  true
        color: "#4E4E4E"

        text: systemHandler.userName
    }

    NavigationSearchBar {
        id: navSearchBox
        width: parent.width * 1.2 / 3
        height: parent.height * 1/12
        anchors {
            left: lockIcon.left
            top:  lockIcon.bottom
            topMargin: 15
        }
    }
}
