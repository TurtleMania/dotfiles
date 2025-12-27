pragma Singleton

import Quickshell

Singleton {
    readonly property int minutes: clock.minutes
    readonly property int hours: clock.hours
    readonly property date full_date: clock.date

    function format(fmt: string): string {
        return Qt.formatDateTime(clock.date, fmt)
    }

    function time(): string {
        return format("hh:mm")
    }

    function date(): string {
        return format("dd-MM-yy")
    }

    SystemClock {
        id: clock 
        precision: SystemClock.Minutes
    }
}
