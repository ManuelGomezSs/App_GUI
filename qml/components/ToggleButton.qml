import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnToggle
    //custom properties
    property url btnIconSource: "../../images/svg_images/9104314201582004494.svg"
    property color btnColorDefault: "#282d3a"
    property color btnColorMouseOver: "#282d3a"
    property color btnColorClicked: "#6aa399"

    QtObject{
        id: internal

        // mouse over and click change color
        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnToggle.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60

    background:  Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image{
            id:iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
        }
        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}
