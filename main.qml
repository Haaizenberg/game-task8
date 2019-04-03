import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id: root
    visible: true
    width: 1000
    height: 500
    title: qsTr("BreakOut")
    color: "lightgreen"



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

