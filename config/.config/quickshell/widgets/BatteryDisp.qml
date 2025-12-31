import Quickshell
import QtQuick
import qs.services
import qs.theme

Text {
    text: `${Math.round(Battery.percent * 100)}%`
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter
    color: Colors.foreground
    font: Fonts.standard
}
