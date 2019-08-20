import QtQuick 2.12
import QtQuick.Controls 2.12

Rectangle {
    width: parent.width
    height: parent.height
    color: qsTr("transparent")
    visible: false

    signal open()
    signal close()
    signal cancel()
    signal submit(string name, string ip)

    onOpen: {
        visible = true
    }

    onClose: {
        visible = false
    }

    onSubmit: {
        // some value is to value
        close()
    }

    onCancel: {
        // Cancelled out
        close()
    }

    Rectangle {
        anchors.fill: parent
        color: Qt.rgba(0, 0, 0, 0.4)
    }

    Rectangle {
        id: modal
        width: 240
        height: 200
        anchors.centerIn: parent
        visible: true
        radius: 4
        border.color: "black"

        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 16
            spacing: 12

            Text {
                text: qsTr("Configure")
            }

            TextField {
                placeholderText: "name"
                font.pixelSize: 14

                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 32
                    radius: 4
                    border.color: "dodgerblue"
                }

            }

            TextField {
                placeholderText: "password"
                font.pixelSize: 14

                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 32
                    radius: 4
                    border.color: "dodgerblue"
                }

            }

            Row {
                spacing: 4
                Button {
                    text: "Cancel"

                    onClicked: cancel()

                }

                Button {
                    text: "Configure"

                    onClicked: submit('', '')

                }


            }

        }
    }


}
