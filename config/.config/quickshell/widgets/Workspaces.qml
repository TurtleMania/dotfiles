import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.theme

Rectangle {
    color: "transparent"

    RowLayout {
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        spacing: 5
        Repeater {
            model: Hyprland.workspaces
            delegate: Button {
                id: workspaceButton
                required property HyprlandWorkspace modelData
                implicitWidth: 15
                implicitHeight: 10
                visible: modelData.monitor.name === screen.name
                onReleased: if (!modelData.focused) { modelData.activate() }

                contentItem: Text {
                    text: workspaceButton.modelData.id
                    font: Fonts.standard
                    opacity: enabled ? 1.0 : 0.3
                    color: workspaceButton.modelData.focused ? Colors.color7 : Colors.color15
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                background: Rectangle {
                    color: "transparent"
                    anchors.fill: parent
                }
            }
        }
    }
}
