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
        id:leftBlock
        width: 5 
        spacing: 4
        anchors.left : parent.left

        ModuleBlock{
          height: parent.implicitHeight
          spacing: 0
          Repeater{
            id: ws
            model: HyprUtils.workspaces
            Workspace{}
          }
          Text{
            id:test2
            text:"||"
          }
        }
      }

      RowLayout{
        id: rightBlock
        spacing:2 
        anchors.right : parent.right
        anchors.verticalCenter : parent.verticalCenter
        ModuleBlock{
          height: parent.implicitHeight
          spacing: 0
          ClockWidget {}
        }
        ModuleBlock{
          height: parent.implicitHeight
          spacing: 0
          Text{
            id:test
            text: "󰎟"
          }
        }
      }
    }
  }
}
