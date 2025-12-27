import Quickshell
import QtQuick
import qs.windows

ShellRoot {
    id: root

    Variants {
        model: Quickshell.screens
        Bar {}
    }
    Variants {
        model: Quickshell.screens
        Wallpaper {}
    }
}
