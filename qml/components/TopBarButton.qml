import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnTopBar
    //custom properties
    property url btnIconSource: "../../images/svg_images/17474714781543238905.svg"
    property color btnColorDefault: "#282d3a"
    property color btnColorMouseOver: "#282d3a"
    property color btnColorClicked: "#6aa399"

    QtObject{
        id: internal

        // mouse over and click change color
        property var dynamicColor: if(btnTopBar.down){
                                       btnTopBar.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnTopBar.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    width: 35
    height: 28


    background:  Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Image{
            id:iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
            visible: false
            fillMode: Image.PreserveAspectFit
            antialiasing: false
        }
        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}
