import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    property int ox: 0
    property int oy: 5
    property int k: 0
    property var obstacleList: []
    id: root
    visible: true
    minimumWidth: 1000
    maximumWidth: 1000
    minimumHeight: 500
    maximumHeight: 500
    title: qsTr("BreakOut")
    color: "lightgreen"

    Timer {
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            if (k < 10) {
                var component = Qt.createComponent("Obstacle.qml")
                if (component.status === Component.Ready) {
                    var e = component.createObject(root,{"x": 10+ox, "y": 2})
                    obstacleList.push(e)
                }
                ox += 100 + 10
                oy += 25 + 5
                k++
            }
        }
    }

    Rectangle {
        id: platform
        x: (root.width-platform.width) / 2
        y: root.height-platform.height
        width: 130
        height: 20
        border.color: "black"
        border.width: 2
        radius: 10
        visible: true
        color: "darkblue"
        focus: true

        property int xv: 0
        Keys.onPressed: {
            if (event.isAutoRepeat) return;
            switch(event.key){
            case Qt.Key_Left: xv-= 4; break;

            case Qt.Key_Right: xv+= 4; break;
            }
        }
        Keys.onReleased: {
            if (event.isAutoRepeat) return;
            switch(event.key){
            case Qt.Key_Left: xv+= 4; break;

            case Qt.Key_Right: xv-= 4; break;
            }
        }
        Timer {
            interval: 1
            running: true
            repeat: true
            onTriggered: {
                if (platform.x < root.width-platform.width && platform.x > 0)
                    platform.x += platform.xv;
                else if (platform.x <= 0)
                    platform.x = 1;
                else if (platform.x >= root.width-platform.width)
                    platform.x = root.width-platform.width-1;
            }
        }
    }
}

