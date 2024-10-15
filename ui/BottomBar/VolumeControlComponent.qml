import QtQuick 2.15

 Item {
    property string fontColor: "#f0eded"

    Rectangle {
        id: decreamentButton
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
        }
        width: height / 2
        color: "green"

        Text {
            id: decrementText
            anchors.centerIn:  parent
            text: "<"
            font.pixelSize: 12
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            // onClicked: hvacController.incrementTargetTemperature( -1 )
        }
    }

    Image {
        id: volumeIcon
        anchors {
            left: decreamentButton.right
            leftMargin: 15
            verticalCenter: parent.verticalCenter
        }
        source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAAHYAAAB2AH6XKZyAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAAA8lJREFUeJztmktsDWEUgL8+oqm2pCJNpYJEPKreiURSC/FYkCBWtCQk1MIjQhdeK7suPBZWViSInYiNSLChFQsWrdajoiREoigR6lG3Fr9JptecM/fOPzO3E/Mls/j/M+f855x778x/z/khJSUlJSUl5X+lpNAOWDIJ2AGsBn4Abwrrjj91QBOwFhhjaWsx8AEY/ntlgOOWNiNlF+ZTchzuwSQkKO0uW+6r1c7NaNiL+YSynb0S0F4xI5PpvjLAFkt/Q2Uf3sEPA18s7PYKNoeBr8BcC9uhoQXvXEHZ6mO3G6iwsG9NLsHbJADghI/tM5b2A5Nr8LYJKAIuKraHgEWWa+RNPsHbJgCgHOhU7HdgEhUL+QavJaAGaAH2A/U+69ZjHnzSGusDRZMnQYKXErAE6Hfd8xPY47P+MWWNewFjypmgwUsJeOBxXwbz5JcoA54q6ywPGJsvNsF7JWCsYm8QWKD40qyscyF4iDK2wUvfgH7l/h7k/xElyBukL3jsC7yejhXAdmAOUCosBDAO2CTYyAcv/VbMO17iCNAmyA4ApwRZM3BZc2YC8Ay7TzSMb0AxcFXR+QSMF3RrgV+C3jkteICTMQcvJQCgCuhS9A4pujcFnT6/BNwZRQkAaFT0Hit6hxW9qe4bi7MUy30cipt24Jogm438Rrit2JznHmQnYDRyWpGtEOY7MW8nL2a4B0lIwF1gQJAtFea/A68E2Uz3IAkJGAJuCbJZit4LYb7GPUhCAgBeCvOTFZ3Pwnyle5CUBLwV5qsUHancNkInKQmI7P98UhJQK8xrRdVKYX6ETlISME2Yf63oSFvlxCWgFFgpyJ4qetOF+XfuQRISsAyoFmRSpacMmCLIet2DJCTggCKTtrwLkRu/agIGc3QqLhqRC5pPMFteL5YrNrvcg+wE3M/JrXioAs4q8vOKbJUw34e8RQaSUxAZQC+IDAl6/xREskteHzGdlG1Ag4fcTVglMS8OAhsUeRvyVncz8u//ho1TXkRRFC0C3iv3d6MXRZ8Lep5F0TCIsyz+DZiv+NKkrBNJWdwhrsZIs+JDwRojDlG3xnb7rH9UWaMjYEx5E3ZzdCemOTrbZ12/5ui6QNEEpBDtca183k6M7XGHOA9IXFJsF+SAhEMcR2T8GjkFOyLjEOUhqS0+drsxr9SCE9UxuUeCzWHMA7HBwnbohH1QEkyD1Cv4DGZDNOpowTQsHEdtj8pexzsBB+3cjJY6zJ+VNdgflp6FOR3uBP6bAIelY38/hkw1sBGYiGmJPyysOykpKSkpKSlJ4g/+Ys6pQNkKowAAAABJRU5ErkJggg=="
    }


    Rectangle {
        id: increamentButton
        anchors {
            top: parent.top
            left: volumeIcon.right
            bottom: parent.bottom
            leftMargin: 15
        }
        width: height / 2
        color: "red"

        Text {
            id: incrementText
            anchors.centerIn:  parent
            text: ">"
            font.pixelSize: 12
            color: fontColor
        }

        MouseArea {
            anchors.fill: parent
            // onClicked: hvacController.incrementTargetTemperature( 1 )
        }
    }


}
