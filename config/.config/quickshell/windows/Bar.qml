import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import qs.data
import qs.theme

PanelWindow {
    id: root
    required property var modelData
    screen: modelData
    color: "transparent"

    WlrLayershell.layer: WlrLayer.Bottom

    anchors {
        top: true
        right: true
        left: true
    }

    implicitHeight: screen.height * 0.03

    PopupWindow {
        id: dashboard
        anchor {
            window: root
            rect.x: root.width - implicitWidth
            rect.y: root.height
        }

        implicitWidth: screen.width * 0.2
        implicitHeight: screen.height * 0.4

        color: "transparent"
        visible: false

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onExited: {
                dashboard.visible = false
            }
            Dashboard {}
        }
    }

    Rectangle {
        color: Colors.background
        anchors.fill: parent
        // TODO: Add outward rounding against screen edges
        // TODO: Link buttons to dashboard opening to page

        RowLayout {
            anchors.fill: parent
            spacing: 6
            anchors.leftMargin: Spacing.windowSpacing
            anchors.rightMargin: Spacing.windowSpacing
            anchors.topMargin: 1
            anchors.bottomMargin: 1
            Text {
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.horizontalStretchFactor: 1
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter

                text: DateTime.time() + "\n" + DateTime.date()
                color: Colors.foreground
                font: Fonts.standard
            }
        }
    }
}
