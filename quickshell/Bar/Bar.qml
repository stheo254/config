// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      color: "transparent"

      anchors {
        top: true
        left: true
        right: true
      }

      margins {
        top: 4
        left: 4
        right: 4
      }

      implicitHeight: 30

      RowLayout{
        id:parentBlock
        anchors.fill: parent
        spacing: 0
        RowLayout{
          id:leftBlock
          width: 100
          spacing: 4
          Layout.alignment: Qt.AlignLeft
          Layout.fillWidth: true
          ModuleBlock{
            height: parent.implicitHeight
            anchors.centerIn: parent
            width: 400
            spacing: 0
            Repeater{
              id: ws
              model: Hyprland.workspaces.values
              Text{
                anchors.centerIn: parent
                text: "test"
              }
            }
          }
        }

        RowLayout{
          id: rightBlock
          spacing: 4
          Layout.alignment: Qt.AlignRight
          Layout.fillWidth: true
          ClockWidget {
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            // no more time binding
          }
        }
      }
    }

  }
}
