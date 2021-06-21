import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    opacity: 0.9
    Rectangle {
        id: rectangle
        color: "#1a1d25"
        anchors.fill: parent

        Label {
            id: label
            x: 310
            y: 205
            color: "#ffffff"
            text: qsTr("configuraciones")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }
    }

}
/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
