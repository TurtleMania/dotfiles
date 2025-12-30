pragma Singleton

import Quickshell
import Quickshell.Services.Mpris
import QtQuick

Singleton {
    id: root
    readonly property MprisPlayer player: Mpris.players.values[0]
    readonly property string current_text: `${root.player.identity || "Unknown identity"}: ${root.player.trackTitle || "Unknown Title"} by ${root.player.trackArtist || "Unknown Artist"} [${root.secondsToTimestamp(Math.round(root.player.position))}/${root.secondsToTimestamp(Math.round(root.player.length))}]`

    function secondsToTimestamp(secs) {
        let hours = Math.floor(secs / (60*60))
        let minutes = Math.floor((secs - hours*60*60) / 60)
        let seconds = Math.floor(secs - hours*60*60 - minutes*60)
        let hour_str = hours === 0 ? "" : hours.toString() + ":"
        let min_str = minutes.toString() + ":"
        let sec_str = seconds.toString().padStart(2, "0")
        return hour_str + min_str + sec_str
    }

    function play() {
        player.play()
    }

    function pause() {
        player.pause()
    }

    function next() {
        if (player.canGoNext) {
            player.next()
        }
    }

    function previous() {
        if (player.canGoPrevious) {
            player.previous()
        }
    }

    function movePlayback(secs) {
        if (player.canSeek) {
            player.seek(secs)
        }
    }

    Timer {
        running: root.player.playbackState == MprisPlaybackState.Playing
        interval: 1000
        repeat: true
        onTriggered: root.player.positionChanged()
    }
}
