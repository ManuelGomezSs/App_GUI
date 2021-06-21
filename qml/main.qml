import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import "components"

Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    opacity: 1
    visible: true
    color: "#00000000"
    title: qsTr("app_gui")

    // remove tittle bar
    flags: Qt.Window | Qt.FramelessWindowHint

    // properties
    property int windowStatus: 0
    property int windowMargin: 10

    // internal functions
    QtObject{
        id: internal

        function resetResizeBorders(){
            // Resize visibility
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeWindow.visible = true
        }

        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize visibility
                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeWindow.visible = false
                btnMaximizeRestore.btnIconSource = "../images/svg_images/12233487071543238905.svg"
            }
            else{
                windowStatus = 0
                mainWindow.showNormal()
                windowMargin = 10
                // resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/11431952621543238902.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 0){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                // resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../images/svg_images/11431952621543238902.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            // resize visibility
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../images/svg_images/11431952621543238902.svg"
        }
    }


    Rectangle {
        id: bg
        color: "#1a1d25"
        radius: 7
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.topMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.rightMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            radius: 7
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#282d3a"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 15
                    width: 200
                    height: 31
                    color: "#111215"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        width: 473
                        height: 16
                        color: "#97b0c1"
                        text: qsTr("descripcion_de_la_aplicacion")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 300
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        x: 600
                        width: 473
                        height: 16
                        color: "#97b0c1"
                        text: qsTr("| INICIO")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 28
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0
                    
                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/348339561610061661.svg"
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 5
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#97b0c1"
                        text: qsTr("aplicacion gui salesiano")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 823
                    width: 105
                    height: 28
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton {
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }

                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/11431952621543238902.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#ff007f"
                        btnIconSource: "../images/svg_images/12355707351582004488.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                opacity: 1
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#282d3a"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation{
                        id:animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 250; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: columnMenus
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            visible: true
                            text: qsTr("Inicio")
                            isActiveMenu: true
                            btnIconSource: "../images/svg_images/20487208561539681116.svg"
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnAcademicNotes.isActiveMenu = false
                                btnPersonalInformation.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
                            }
                        }

                        LeftMenuBtn {
                            id: btnPersonalInformation
                            width: leftMenu.width
                            visible: true
                            text: qsTr("informacion personal")
                            btnIconSource: "../images/svg_images/1388560951582004484.svg"
                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnAcademicNotes.isActiveMenu = false
                                btnPersonalInformation.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/personalInformationPage.qml"))
                            }

                        }

                        LeftMenuBtn {
                            id: btnAcademicNotes
                            width: leftMenu.width
                            visible: true
                            text: qsTr("notas academicas")
                            btnIconSource: "../images/svg_images/2058381931582004487.svg"
                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnAcademicNotes.isActiveMenu = true
                                btnPersonalInformation.isActiveMenu = false
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/academicNotesPage.qml"))
                            }
                        }
                    }

                    LeftMenuBtn {
                        id: btnSettings
                        x: 0
                        y: 414
                        width: leftMenu.width
                        visible: true
                        text: qsTr("configuraciones")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 20
                        btnIconSource: "../images/svg_images/8071850171582004495.svg"
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnAcademicNotes.isActiveMenu = false
                            btnPersonalInformation.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))
                        }
                    }

                }

                Rectangle {
                    id: contentPages
                    opacity: 1
                    color: "#1a1d25"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
                    }
                }

                Rectangle {
                    id: rectangle
                    width: 200
                    height: 200
                    color: "#111215"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfo1
                        width: 473
                        height: 16
                        color: "#97b0c1"
                        text: qsTr("descripcion_de_la_aplicacion")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                        anchors.bottomMargin: 0
                        anchors.leftMargin: 0
                    }

                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 0
                        width: 24
                        height: 24
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }

                        }
                        Image {
                            id: resizeImage
                            x: -27
                            y: -22
                            width: 24
                            height: 24
                            anchors.right: parent.right
                            anchors.bottom: parent.bottom
                            source: "../images/svg_images/21332335061581068823.svg"
                            sourceSize.height: 300
                            sourceSize.width: 300
                            anchors.bottomMargin: 5
                            anchors.rightMargin: 5
                            fillMode: Image.PreserveAspectFit


                        }
                        ColorOverlay{
                            anchors.fill: resizeImage
                            source: resizeImage
                            color: "#576263"
                            antialiasing: false
                        }


                    }
                }
            }
        }    
    }

    Connections{
        target: backend
    }

    DropShadow{
        visible: true
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 4
        color: "#31383b"
        source: bg
        z: 0
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.LeftEdge) }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.RightEdge) }
        }
    }

    MouseArea {
        id: resizeBottom
        y: 570
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if (active) {mainWindow.startSystemResize(Qt.BottomEdge) }
        }
    }
}

