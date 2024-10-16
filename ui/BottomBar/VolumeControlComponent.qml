import QtQuick 2.15

Item {
    property string fontColor: "#f0eded"

    Connections {
        target:  audioController
        function onVolumeLevelChanged(){
            visibleTimer.stop()
            volumeIcon.visible = false
            visibleTimer.start()
        }
    }

    Timer {
        id: visibleTimer
        interval: 1000
        repeat: false
        onTriggered: {
            volumeIcon.visible = true
        }
    }


    width: 90 * (parent.width / 1280)

    // Rectangle {
    //     anchors {
    //         left: decreamentButton.left
    //         right: increamentButton.right
    //     }

    //     Component.onCompleted: console.log( width )
    // }

    Rectangle {
        id: decreamentButton
        anchors {
            top: parent.top
            right: volumeIcon.left
            bottom: parent.bottom
            rightMargin: 15
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
            onClicked: audioController.increamentVolume( -1 )
        }
    }

    Image {
        id: volumeIcon
        anchors {
            right: increamentButton.left
            rightMargin: 15
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .5
        fillMode: Image.PreserveAspectFit
        source: {
            if(audioController.volumeLevel < 1)
                return "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAA5JJREFUeJztm81rHlUUh59TIuKiYito1UqCoa4UFKwLK/i1KGgVad1KQf+A2LoTbJNidxUbd90FxJXWZXVRsC66KFV04cbSikUESf2qggUFHxfvTPuavDNN8s7cO9P4QDZ37px7zi9nzv2Yd+B/uoV6s3qfelNuX5KiblBfV393wKL6Qm6/kqDeo550OVfUe3P71yrqbvWnEcGXvNrm+BvaNF6Heos6DxwHbq/pemubfky0abwK9RHgfeD+HOMPkzQD1FBngNN0IHhImAHqFmAB2JlqzJWQJAPU3cDXdCx4aFmAVRS6bLT2CHSp0NXReAZ0sdDV0WgGFKu294AnmrTbJo1lgLoH+IoeBQ8NCKBuVI8BHwKbx3cpLWM9Aup2BoVuWzPupOeqAOoU8CKwZYX3bgJeIdNyuikmANTHgRPAxrzupKesAW+zDoOHawI8nNWLjJQCrK/ztyGyHYh0hd4KoG5Vj6mfqUfU267Tf5f6QfG3a+nFLrNvRDCb1R+W9DtvxQGqOjfC7l7obwa8DNy9pG0a+HSpCOoccGCEjTegvwJsqmj/jwg1wQPcAf0V4GPgn4prpQhHqQ4e4BPoqQARcQY4WNNlGpipuf4tsA96KgBARLwFzK3h1ovAMxHxI/RYAICImGV1IlwEnoyI78qGXgsAqxJhWfBwAwhQEGvt13sBrjPVDTPJYHaYGm7stQCrCL5kEjg1LEJvBVDfZHXBl0wCJ9U7oacCqDuA2ZouF4D5muvTwFHo73nec1T/8y4AT0XE9+plqrNkJzVGus6vFe1XgweIiIPAoYq+i9BfARaAS0vazjMUfEkhwqh1wmHo6SMQEZfURxnsB7YBZ4BDEXG5ov+sehbYWzQtRMQJKBYGqu27vWb2R8Q7bRnv6yPQGKUAf2f1IiOlAF9m9SIjpQD7gT9yOpKLCYCIOK0+yODl6F0rvPeGeDk6Fup29VxT598VLDsWb5KxZoGIOAs8BLzbjDvpGXsajIg/I2IGeAn4ZXyX0tLYOiAijjPIhlNN2UxBowuhYh3+NPAa8FeTttui8ZVgRBgR88AO4FzT9pumtaVwRHxODwpkq3uBiLhSFMg9wM9tjrVWkmyGIuIj4AGK93FdItlusHgV9SwdK5BJt8NDBfIx4JuUY1eR5TwgIr5g8Mu0ThfIJJj5s7lOYP2Hk1tz+5cEr306+1sR/KL6fG6/kuPg4+kpdf2eM6TkX7wY4nLqA5x+AAAAAElFTkSuQmCC"

            else if(audioController.volumeLevel > 50)
                return "data:image/png;base64,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"

            else if(audioController.volumeLevel > 25 )
                return "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAABEtJREFUeJztm1uIVWUYhp9vzMywg6EdRqqhIpVUQummiyKiGqubsG4qEYKiuogK6aooypuaIirogEQQJmVYFwUZhVFXXQRKIlbSGacyCI/jTFO+XcySZO/v33utNfv/19q43sv3++Y7vGvt/7gGGjRo0KBBekhaLmm9pNckLa+6nqSQdLOkcf2PIyeMCFnzE2rHy1XUM5AymaSVwLvAyY55XspajiGZAFnz7wGnpMqZB0kEqGvzkECAOjcPcFLM4JKGidi8pGXAPcAk8IKZ/RQjTylIGs6mt7zYVDD+ipb4+yVdEaufQijRfBkB3nJi7JW0sEicno8B2Wv/PvF/897Pdz7woaQzIuf2UfLJl30DrpT0TyDWO7F67FTQdJovLECW894O8VbnidF1FpBkwDJgCH8FB3AuMALMyll7T2Bmr0paADzqmEckfWBm+0onkHS9pG+m8VSLwH0DJJmkuR1qHJD0aSDmc9Np/jaFf2Mx0CaApBsl/ZbZt0laHKh1UFPTYCsOS5pfpvl5gYAxsamlhrmS9rX47JF0YaDmhwNxn+rUa2gavB04vbByvcUSoHU6GwQ2S/LGmpeAXxz+LkkzQklCAlyeq8S4+A6YcPgVwGOtpJlNAs87/oPA1aEkIQHm5CgwKszsD+CRgHmtpCGHfxP42+FXhfIkPRApCjN7EXjDMc3CEcfM/gI+cvyvCeWotQAZ7gd+dfjVkk51+C0Ot0jSOV7w2gtgZuPA445pDrDS4T/3wjA1qLah9gJk2AgccvhrHe5bYNzhL/UC94UAZjYBfOyY2mYrMzsKfO/4Dnmx+0KADNsd7qKA716Hc9c1/STAqMOdGfA96HCneY79JIDFCNpPApzncKGtrve0vbeirwTwluc/BHzPdrgDnmNfCJBtfm5wTNsc3wHgYsf3Ry92XwgA3IG/P9nqcAvxD2R3e4FrL4Ck2cATjukg/rrf2/kJ2OHFr70AwCvA+Q6/wczGHN5bHu8yM29tUG8BJD0ErHFM48Azjv9ZwLDj/1koR0gAb92dFNnu7emAeSRwD7gG/+R6cyhPSIC20bUCXALMdPivgHWtpKSZwIOO/yjwRShJSICNwP7uNUbF17QvdEaBVWbmnfo8AFzg8K+b2b+Fs0u6VdUfi18n6WdJRyV9KWlRoNYFkg44MQ9JKv/pTVbArqoEOK6O2R1sMyRtDcQc6dZjx6sxM/sEWCxpKVNbz0quxszsSAfzk/hnfr/jjBXRoGouR+/rEO/OGH12Kyjl9fhVCo9Rb8fqMU9hZUUoKsCGQJzdknLfavV8JWhmW4Bb8A8me4lJh/sTuMnM3K1vUpR4E8p8JDV23N/X5yOpYygoQplBcKmkZyWtU+DWuHIUEKGwAL1A9N1gwjGhFJJsh+ssQrLzgLqKkPRApIsIe1LWUinU/i8zY5Iuq6KWKLcteSBpCXA3UweW681sZ1W1NGjQoMEJi/8Ak0w84Tj6vYMAAAAASUVORK5CYII="

            else
                return "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAAzxJREFUeJztmk+oVkUYh5+3679UhBZuoohSw+heECKoMIjIiBZtFGmtkZvcCu5atApECQoKIlzkolUEQbdok1IRFAkRRtQiCBIDU7Hgij4tPg35HLtzznfmnO989zzLd8688/5+Z5jzZwYGBgYGBgZWLNF1ATejBrAH2A1sBS4AnwFvR8T5LmsrjrpZ/dQ0Z9WdXddYDPVB9efbiL/BefW+rmttHHWn+ucy4m/wZtf1Noq6R/07U7zqma5rbgz1sHqtgnjVpa7rnhh1lfpWReH/0XX9E6FuVD+uK77XBqh3q99NIr63BqgL6m+Tii9hwB1NJxxHfRY4BdxbeqypQ31JvdLEnS81A4qghvpqk8J7Y4C6Vj1RQnwJA1bVEDgPvAjcD6xOXLIdWJiwrtbINkCdA44AB2lh8cxF3Qa8DKwFjkfEt6UGOlZqWldhrKaH1L9uar6sPlJC/Lx6tQvB44zV9Ubiki+qaMudynsrXNsmVxOxJ9VnchPkitqSm7BljgOpJ8P+3AS5BqRW+86JiO+BDxNNL6gbcnJM47SuyjuJ2HogazGcBQM+B/5JxB/N6dx7AyLiCvBDoinr46v3BlznbCJ2V07HWTFgLhFLPSJvYVYM2JyIncvp2HsD1HXAfKLpj5z+vTcAeApYl4h/k9N5Fgx4JRG7xEowwNGG6fOJpk+uPx6XpbcGqHcC75He4j+am6e3BgAHGJ0hGOdURHyVmyTXgEu5CVvk4URsifSacFtyDThdJWlLLCZir0VE87U6Or1xobXfPv/DWF2HHP0Su6y+7ui/ZSWyzwipe4ETpF87WyMibqlZXRMRtbbOsxfBiPgAeA74sc5AJakrHmqeElMXgAeANYnmHcDhurmXIzUDpg51t9WOvtRaA5qgmJvqY8BHpL/UatP0DCj2IhQRXwOPAz+VGqMJir4JRsQvwBPAyZLjTD2Odozfn8Y1oDVs6MxA1zomRt2vLq1YAwDUXdZ8te669sZQd6i/V9R/seu6G0W9Rz1dwYAvu665cdRN6mKmAfu6rrcI6pzLnx9etMbnbq9Q96nnxoRfU981c7u7KlP3ZaVuAp5mdNrsIqM/vL92W9XAwMCs8i+BJIKhaX+SvAAAAABJRU5ErkJggg=="
        }
    }

    Text {
        id: volumeTextLable
        anchors.centerIn: volumeIcon
        visible: !volumeIcon.visible
        text: audioController.volumeLevel
        font.pixelSize: 24
        color: fontColor
    }


    Rectangle {
        id: increamentButton
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
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
            onClicked: audioController.increamentVolume( 1 )
        }
    }


}
