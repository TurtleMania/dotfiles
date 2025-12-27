import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import qs.data
import qs.theme

Rectangle {
    id: root
    anchors.fill: parent
    anchors.margins: Spacing.windowSpacing
    color: Colors.background
    radius: 5
    Rectangle {
        id: calendarView
        anchors.fill: parent
        color: "transparent"

        GridLayout {
            rows: 3
            columns: 2
            anchors.fill: parent
            Layout.horizontalStretchFactor: 5
            
            Text {
                Layout.row: 0
                Layout.column: 1
                Layout.horizontalStretchFactor: 5
                Layout.verticalStretchFactor: 1
                text: grid.title
                color: Colors.foreground
            }
            
            DayOfWeekRow {
                Layout.row: 1
                Layout.column: 1
                Layout.horizontalStretchFactor: 5
                Layout.verticalStretchFactor: 1
                locale: grid.locale
                delegate: Text {
                    text: shortName
                    font: Fonts.standard
                    color: Colors.foreground
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    required property string shortName
                }
            }

            WeekNumberColumn {
                Layout.row: 2
                Layout.column: 0
                Layout.horizontalStretchFactor: 1
                Layout.verticalStretchFactor: 10
                month: grid.month
                year: grid.year
                locale: grid.locale
                delegate: Text {
                    text: weekNumber
                    font: Fonts.standard
                    color: Colors.foreground
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    required property int weekNumber
                }
            }

            MonthGrid {
                id: grid
                Layout.row: 2
                Layout.column: 1
                Layout.horizontalStretchFactor: 5
                Layout.verticalStretchFactor: 10
                month: Calendar.December
                year: 2025
                locale: Qt.locale("en_US")
                delegate: Text {
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: model.day
                    font: Fonts.standard
                    color: Colors.foreground
                    required property var model
                }
            }
        }
    }

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: calendarView
    }
}
