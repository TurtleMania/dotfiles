import QtQuick
import qs.theme
import qs.services

Rectangle {
    id: root
    color: "transparent"

    Text {
        anchors.fill: parent
        text: Mpris.current_text
        
        color: Colors.foreground
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
