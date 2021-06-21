import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Timeline 1.0
import "components"

Window {
    id: splashScreen
    width: 380
    height: 580
    opacity: 0.9
    visible: true
    color: "#00000000"
    title: qsTr("iniciar_sesion")

    //remove tittle bar
    flags: Qt.Window | Qt.FramelessWindowHint

    //internal fuctions
    QtObject{
            id:internal

            function checkLogin(username, password){
                if(username === "manuel"  || password === "123456"){
                    var component = Qt.createComponent("main.qml")
                    var win = component.createObject()
                    win.show()
                    visible = false
                }
            }
        }

    Rectangle {
        id: bg
        x: 108
        y: 190
        width: 360
        height: 560
        color: "#151515"
        radius: 7
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1

        Image {
            id: logoImage
            x: 36
            y: 28
            width: 324
            height: 172
            opacity: 0.17
            source: "../images/LOGO.png"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        CustomTextField {
            id: textUsername
            x: 30
            y: 352
            opacity: 1
            anchors.bottom: textPassword.top
            anchors.bottomMargin: 10
            placeholderText: "usuario"
        }

        CustomTextField {
            id: textPassword
            x: 30
            y: 411
            opacity: 1
            anchors.bottom: btn.top
            anchors.bottomMargin: 10
            placeholderText: "contraseña"
            echoMode: TextInput.Password
        }

        CustomBtn {
            id: btn
            x: 30
            y: 473
            width: 300
            opacity: 1
            text: "ingresar"
            anchors.bottom: parent.bottom
            font.family: "Segoe UI"
            colorPressed: "#55ff84"
            colorDefault: "#66dd87"
            anchors.bottomMargin: 50
            onClicked: internal.checkLogin(textUsername.text, textPassword.text)
        }

        Label {
            id: label1
            x: 63
            y: 317
            opacity: 1
            color: "#ffffff"
            text: qsTr("ingrese con su usuario y contraseña")
            anchors.bottom: textUsername.top
            anchors.bottomMargin: 20
            font.pointSize: 11
            font.family: "Segoe UI"
        }

        Label {
            id: label
            x: 120
            y: 285
            opacity: 1
            color: "#ffffff"
            text: qsTr("iniciar sesion")
            anchors.bottom: label1.top
            anchors.bottomMargin: 10
            font.family: "Segoe UI"
            font.pointSize: 16
        }

        CircularProgressBar {
            id: circularProgressBar
            x: 55
            y: 148
            opacity: 0.9
            text: "%"
            anchors.verticalCenter: parent.verticalCenter
            value: 110
            anchors.horizontalCenter: parent.horizontalCenter
            progressWidth: 8
            textSize: 12
            strokeBgWidth: 4
            progressColor: "#55ff84"
        }

        TopBarButton {
            id: btnClose
            x: 317
            y: 8
            btnColorDefault: "#151515"
            btnColorClicked: "#ff007f"
            btnIconSource: "../images/svg_images/12355707351582004488.svg"
            onClicked: splashScreen.close()
        }

        MouseArea {
            id: mouseArea
            x: 8
            width: 297
            height: 17
            anchors.top: parent.top
            anchors.topMargin: 0
        }
    }

    DropShadow{
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 7
        color: "#31383b"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                loops: 1
                running: true
                duration: 3000
                to: 3000
                from: 0
            }
        ]
        endFrame: 3000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: circularProgressBar
            property: "value"
            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1300
                value: 100
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"
            Keyframe {
                frame: 1301
                value: 1
            }

            Keyframe {
                frame: 1800
                value: 0
            }
        }

        KeyframeGroup {
            target: logoImage
            property: "opacity"
            Keyframe {
                frame: 1799
                value: 0
            }

            Keyframe {
                frame: 2300
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: label
            property: "opacity"
            Keyframe {
                frame: 1900
                value: 0
            }

            Keyframe {
                frame: 2400
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: label1
            property: "opacity"
            Keyframe {
                frame: 2001
                value: 0
            }

            Keyframe {
                frame: 2500
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: textUsername
            property: "opacity"
            Keyframe {
                frame: 2100
                value: 0
            }

            Keyframe {
                frame: 2600
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: textPassword
            property: "opacity"
            Keyframe {
                frame: 2201
                value: 0
            }

            Keyframe {
                frame: 2700
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: btn
            property: "opacity"
            Keyframe {
                frame: 2299
                value: 0
            }

            Keyframe {
                frame: 2800
                value: 1
            }

            Keyframe {
                frame: 0
                value: 0
            }
        }

        KeyframeGroup {
            target: bg
            property: "height"
            Keyframe {
                frame: 1299
                value: 360
            }

            Keyframe {
                easing.bezierCurve: [0.222,0.00155,0.223,1,1,1]
                frame: 1900
                value: 560
            }

            Keyframe {
                frame: 0
                value: 360
            }
        }
    }
}


