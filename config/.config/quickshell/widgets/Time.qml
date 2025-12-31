import Quickshell
import QtQuick
import qs.data
import qs.theme

Text {
    text: DateTime.time() + "\n" + DateTime.date()
    horizontalAlignment: Text.AlignRight
    verticalAlignment: Text.AlignVCenter
    color: Colors.foreground
    font: Fonts.standard
}
