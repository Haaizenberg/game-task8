import QtQuick 2.0

Rectangle {
    id: bullet
    width: 10
    height: 10
    color: "red"
    visible: true
    NumberAnimation on y{
        from: y
        to: -15
        duration: 700
        running: true
    }
}
