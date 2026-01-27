pragma Singleton

import Quickshell
import Quickshell.Services.UPower

Singleton {
    readonly property real percent: UPower.displayDevice.percentage
    readonly property real active: UPower.displayDevice.ready && UPower.devices.values.length != 0
}
