import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.12
import Qt.labs.platform 1.1

Window {
    id: main
    visible: true
    width: Screen.width
    height: Screen.height

    title: qsTr('ll')

    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    property bool admin_status: true
    property string date_str: "Wednesday, 10th July, 2019"
    property string time_str: "10:54am"
    property string allocated_time: "4:00:00<span style='font-size:36px;'>hrs</span>"
    property string rem_time: "4:00:00"

    signal startSmallScreen()
    signal configureTimer()

    onStartSmallScreen: {
        main.width = 324
        main.height = 650
        main.y = Screen.desktopAvailableHeight - 650
        main.x = Screen.desktopAvailableWidth - 428
        main.hide()
        trey.show()
        trey.showInfo("")
    }

    onConfigureTimer: {
        main.showNormal();
        configPopup.open();
    }

    Rectangle {
        id: ankor
        anchors.fill: parent
        visible: true

        Rectangle {
            anchors.fill: parent

            Rectangle {
                id: bg
                anchors.fill: parent

                Image {
                    sourceSize: Qt.size(parent.width, parent.height)
                    source: "../images/blueberry.jpg"
                    fillMode: Image.PreserveAspectCrop
                }

            }

            Rectangle {
                id: passCont
                anchors.fill: parent
                color: "transparent"
                visible: false

                Rectangle {
                    anchors.centerIn: parent
                    width: 256
                    height: 104
                    radius: 16
                    color: Qt.rgba(0, 0, 0, 0.7)
                    border.color: Qt.rgba(255, 185, 0, 0.1)

                    TextField {
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 16
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderText: "password"
                        placeholderTextColor: Qt.rgba(255, 255, 255, 0.7)

                        background: Rectangle {
                            id: tfBg
                            implicitWidth: 200
                            implicitHeight: 40
                            radius: 6
                            color: "transparent" //Qt.rgba(0, 0, 0, 0.0)
                            border.color: Qt.rgba(255, 185, 0, 0.7)
                        }

                    }


                }


            }

            Rectangle {
                id: timeCont
                anchors.fill: parent
                visible: false
                color: Qt.rgba(0, 0, 0, 0.3)

                Column {
                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.bottomMargin: 116
                    anchors.leftMargin: 36
                    spacing: 0

                    Text {
                        text: time_str
                        color: "white"
                        font.family: "Segoe UI Semilight"
                        font.pixelSize: 40
                    }

                    Text {
                        text: date_str
                        color: "white"
                        font.family: "Segoe UI Semilight"
                        font.pixelSize: 32
                    }

                }


            }

            Rectangle {
                anchors.centerIn: parent

                color: "transparent"

                Column {
                    anchors.centerIn: parent

                    Text {
                        //width: parent.width
                        //horizontalAlignment: Text.AlignHCenter
                        text: qsTr("You have been assigned")
                        color: "white"
                        font.family: "Roboto light"
                        font.pixelSize: 16
                    }

                    Text {
                        width: parent.width
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.RichText
                        text: allocated_time
                        color: "white"
                        font.family: "Roboto"
                        font.pixelSize: 80
                    }

                    Text {
                        //width: parent.width
                        //horizontalAlignment: Text.AlignHCenter
                        text: "you're been logged in..."
                        color: "white"
                        font.family: "Roboto light"
                        font.pixelSize: 14
                    }


                }


            }

            Rectangle {
                anchors.fill: parent
                color: "transparent"

                MouseArea {
                    anchors.fill: parent

                    onDoubleClicked: {
                        ankor.visible = false
                        small_main.visible = true

                        startSmallScreen()

                    }

                }

                focus: true
                Keys.forwardTo: [keyHandler]
                Keys.onPressed: {
                    if (event.key) {
                        console.log('love: ', event.key);
                        event.accepted = true;
                        console.log('like: ', event.key);
                    }
                }

            }

        }

        Rectangle {
            id: keyHandler
            anchors.fill: parent
            color: "transparent"

            Keys.onTabPressed: {
                console.log('tab is handled');
                event.key = Qt.Key_0;

                event.accepted = true;
            }

            Keys.onPressed: {
                event.accepted = true
            }

        }

    }


    Rectangle {
        id: small_main

        width: parent.width
        height: parent.height
        visible: false
        color: "#ffffff"

        Rectangle {
            anchors.fill: parent

            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 32
                    color: "dodgerblue"
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    color: "transparent"

                    Canvas {
                        id: cv
                        anchors.centerIn: parent
                        width: 160
                        height: 160

                        onPaint: {
                            var ctx = getContext('2d');
                            ctx.strokeStyle = Qt.rgba(0, 0, 0, 0.4);
                            ctx.lineWidth = 12;
                            ctx.beginPath();
                            ctx.moveTo(20, 20);//start point
                            //ctx.bezierCurveTo(-10, 90, 210, 90, 180, 0);
                            ctx.ellipse(20, 20, 120, 120);
                            ctx.stroke();
                        }

                    }

                    Canvas {
                        anchors.centerIn: parent
                        width: 160
                        height: 160

                        onPaint: {
                            var ctx = getContext('2d');
                            ctx.strokeStyle = "dodgerblue";
                            ctx.lineWidth = 10;
                            ctx.beginPath();
                            //ctx.moveTo(20, 20);//start point
                            //ctx.bezierCurveTo(-10, 90, 210, 90, 180, 0);
                            //ctx.ellipse(20, 20, 80, 80);
                            ctx.arc(80, 80, 60, 0, 4.00, false);
                            ctx.stroke();
                        }

                    }

                    Text {
                        anchors.centerIn: parent
                        text: rem_time
                        font.family: "Segoe UI Semilight"
                        font.pixelSize: 24
                    }

                }

                Text {
                    Layout.fillWidth: true
                    Layout.bottomMargin: 12
                    horizontalAlignment: Text.AlignHCenter
                    text: qsTr("You're logged in")
                    font.family: "Roboto light"
                    font.pixelSize: 14
                    color: "dodgerblue"
                    renderType: Text.NativeRendering
                }

            }

        }

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: main.close()

        }

        Dialoger {
            id: configPopup
            anchors.centerIn: parent
        }

    }


    SystemTrayIcon {
        id: trey

        icon.source: "../images/disc_logo.png"

        onActivated: {
            if(reason === SystemTrayIcon.Trigger) {
                main.showNormal()
            }
        }

        signal showInfo(string info)

        onShowInfo: {
            if(info) {
                showMessage("Timer Window minimised", info)
            } else {
                showMessage("Timer Window minimised", "The Timer window has been minimised to system tray." +
                            " Click on the icon in the Tray for more info.")
            }

        }

        menu: Menu {

            MenuItem {
                text: qsTr("Show Time")
                onTriggered: main.showNormal()
            }

            MenuItem {
                visible: admin_status
                text: "Configure"
                onTriggered: configureTimer()
            }
        }

    }


}
