import QtQuick
import QtQuick.Layouts
// import Quickshell.Hyprland
import qs


RowLayout {
  id: root
  // property HyprlandMonitor monitor: Hyprland.monitorFor(screen)
  property int extraWidth: 16
  property int spacing: 8
  property int margin: 0
  property int leftMargin:0
  property int rightMargin: 0
  default required property list<Item> items

  signal specialWidthChanged

  Rectangle {
    id: moduleRect
    Layout.preferredWidth: moduleRow.width + root.extraWidth
    Layout.preferredHeight:24 
    Layout.margins: root.margin 
    Layout.leftMargin: root.leftMargin
    Layout.rightMargin: root.rightMargin
    implicitHeight:24 
    radius:10 
    color: ThemeItem.barScndBgColour
    opacity: 0.85


    RowLayout {
      id: moduleRow
      height: parent.implicitHeight
      anchors.centerIn: parent
      spacing: root.spacing
      children: root.items
    }
  }
}
