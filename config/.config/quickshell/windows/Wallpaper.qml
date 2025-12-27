import Quickshell
import Quickshell.Wayland
import QtQuick
import qs.data

PanelWindow {
    id: root
    required property var modelData
    screen: modelData

    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Background

    anchors {
        top: true
        bottom: true
        right: true
        left: true
    }

    Image {
        anchors.fill: parent
        // Don't use asynchronous to avoid screen flashing during wallpaper change.
        asynchronous: false
        fillMode: Image.PreserveAspectCrop
        source: Qt.resolvedUrl("../wallpapers/" + Selections.wallpaper)
    }
}
