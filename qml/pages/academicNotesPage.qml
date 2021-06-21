import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    opacity: 1
    Rectangle {
        id: rectangle
        color: "#1a1d25"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0



        Rectangle {
            id: rectangle1
            width: 535
            color: "#0b0e0d"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            rotation: -0.064

            ComboBox {
                id: comboBox
                x: 35
                y: 36

                ColorAnimation {
                    from: "white"
                    to: "black"
                    duration: 200
                }
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:2}
}
##^##*/
