import QtQuick 2.0
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left_Menu_Text")

    //custom properties
    property url btnIconSource: "../../images/svg_images/9104314201582004494.svg"
    property color btnColorDefault: "#282d3a"
    property color btnColorMouseOver: "#282d3a"
    property color btnColorClicked: "#6aa399"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#6aa399"
    property color activeMenuColorRight: "#1a1d25"
    property bool isActiveMenu: false

    QtObject{
        id: internal

        // mouse over and click change color
        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background:  Rectangle{
        id: bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }

    }

    contentItem: Item{
        anchors.fill: parent
        id: content
        Image{
            id:iconBtn
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 26
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            source: btnIconSource
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }
        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }

        Text {
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:60;width:250}
}
##^##*/
