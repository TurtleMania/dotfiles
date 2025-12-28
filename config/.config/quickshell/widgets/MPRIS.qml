import Quickshell
import Quickshell.Services.Mpris
import QtQuick
import qs.theme

Rectangle {
    id: root
    color: "transparent"
    readonly property MprisPlayer player: Mpris.players.values[0]

    function secondsToTimestamp(secs) {
        let hours = Math.floor(secs / (60*60))
        let minutes = Math.floor((secs - hours*60*60) / 60)
        let seconds = Math.floor(secs - hours*60*60 - minutes*60)
        let hour_str = hours === 0 ? "" : hours.toString() + ":"
        let min_str = minutes.toString() + ":"
        let sec_str = seconds.toString().padStart(2, "0")
        return hour_str + min_str + sec_str
    }

    Text {
        anchors.fill: parent
        text: `${root.player.identity || "Unknown identity"}: ${root.player.trackTitle || "Unknown Title"} by ${root.player.trackArtist || "Unknown Artist"} [${root.secondsToTimestamp(Math.round(root.player.position))}/${root.secondsToTimestamp(Math.round(root.player.length))}]`
        color: Colors.foreground
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Timer {
        running: root.player.playbackState == MprisPlaybackState.Playing
        interval: 1000
        repeat: true
        onTriggered: root.player.positionChanged()
    }
}
