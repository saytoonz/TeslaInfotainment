import QtQuick 2.15

Rectangle {
    id: bottomBar
    anchors {
        left: parent.left
        right: parent.right
        bottom: parent.bottom
    }
    color: "black"
    height: parent.height / 12

    Image {
        id: carSettingsIcon
        anchors {
            left: parent.left
            leftMargin: 30
            verticalCenter: parent.verticalCenter
        }
        height: parent.height * .85
        fillMode: Image.PreserveAspectFit
        // source:  "qrc:/resources/ui/assets/car.png"
        source: "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAACXBIWXMAAA7DAAAOwwHHb6hkAAAAGXRFWHRTb2Z0d2FyZQB3d3cuaW5rc2NhcGUub3Jnm+48GgAABLVJREFUeJztmU1sFWUUhp9DKdIWSmtNEDDyGxW1aNRojHZlVGqMugAXDTvtxujGxLjWlTEx0a3IQoHEuDDGYFwILIxGowb/iGKQ0h8gaQqVtrZQafu6+GZu505npvfemdvblnmSycy995tz3vPdmTNnzgc5OTk5OTk5OTk5OdcjVg2jktYAu4CdwDZgM9DmbTcBLUADsNo75SpwBbgMXAQueVsf0AP8AfxmZuNZa81kAiTVAY8Bu4HHgTuBFVnYDjCDm4ivgC+BY2Y2k7GP8pDUIOl1Sb1aeHo93w21Cv4eSX/XIPAwpyXtqjSOim4BSe3AN0BzwrCzwC/ASeAccAE4j7u3x4BpMxv17DUDdZ69G4FNwAbgFqAduBfYmuBrBOgws98riacsJG2Q1BfxT4xK2i/paUktVfDb4tne7/kK0ydpY9Z+o4QciXB+sBpBJ2hokXQoQseRajt+LsLpW1V1mqzn7Qg9z1bLWZ2kv0LOjknK+nFXrqbjIU2n5B7LmTvrCjn6T9LOzB2Vr+suSddC2rqyMNwpqT/iEvN5PwP9mSDpQILOPkm7KzF6LsHolKTtVYilIiRt9zTFMRB37soEu0ll5nlcjV6J2FVAk/fxBm8/6e0nzGxy7lnz0gMMAnGPQcWdmDQB7wLvxPx2K3Bc0hCumGpJ2APUA2sSfM0qVUHrBLMTMwpMB/ZjwFRgv5H44AHeK8V3UMQeRRc7S5U+SXuiYrVQ4PXAIeD5smZs6fAJsM/MrvlfhJ/hb7J8gwcX2xvBLwpXgFzxMIhrWvj8i8sTq1mazODyRrBMvwSsN7NpKL4C2ikOvsPM1ppZA3A78DLwOS45LVYmgC+A14AHgVVm1opr0Pi04WItRlJ3IGlMK6aclNQs6UVJPy94KovnhKQXJK2N0VwfGt/t/xa8ArYFjlfg+nlzMLNRM/sAuB94JWrMAiLclfmAmR0ws7GYcXeEPhdiDdYBm0ODPpL0KvCjmY1rtmnRBNwMrCe5jlgIhKsDnpQ0CAzh8taMmY1IasLdCuF6Zot/EEyCXwMd1Va8SPjWzB6F4lugtUZiasE6/yA4AZEJZJlSiPW6n4BgEmuKGJiGSeBP4BRwBrfK0wsM4BLVODBmZlOSWnF/ht8R3oLrAt8G3I2rQ+oz1FZ4MQsmwXGgMaXhYeAg8BnwvZldTWkPAEmNwCPAU8A+3PJaGq6YWXGski6mLEY+1QJ0hiU1SjqcUuuwby94BQzgFiIqpcXMRtIEVypyt8zwvAPjuWBmm6A4Cf6TShU8k/L8cngi5fmFWINJ8CxRLwml86GkDuAwLuGNADKzyylsImkd7o9qxi2XdQEvpbFJoJ0XnIAzKY0a0O1tBaTYdlwtKcQavAVO1kBIrSgsogYn4EQNhNSKQqzhjtAQy/+dYARo8ztChRxgZtOSjgJ7M3I0gcu2w97mHwfb2UFW4krUOlxF2Opt/nFJbfUSOOoHD3O7wjuAj3HNjlIZB/qBH4DvgJ+AHjNL+1gtQq7bsxW4D3gYeAjYQXkl/K/AXjM7PZ+zgRIrqv4K48kMJa9fBoldHosy2lnCJPSrkkXHjNH8i7i+1s5aa83JycnJycnJycnJWTz8D6eVXbEweJ3uAAAAAElFTkSuQmCC"
    }

    HVACComponent {
        id: driverHVACController
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: carSettingsIcon.right
            leftMargin: 150
        }

        hvacController: driverHVAC
    }

    HVACComponent {
        id: passengerHVACController
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: volumeController.left
            rightMargin: 150
        }

        hvacController: passengerHVAC
    }

    VolumeControlComponent {
      id: volumeController
      anchors {
          top: parent.top
          bottom: parent.bottom
          right: parent.right
          rightMargin: 30
      }
    }
}
