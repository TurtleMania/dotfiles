pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    readonly property real percent: UPower.displayDevice.percentage
}
