import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

import qs
import qs.bar.utils

Item{
  property var defaultWs : [1,2,3,4,5,6]
  property var focused : Hyprland.focusedWorkspace
    width: 20
    height: 20
    
  Rectangle {  // Use Rectangle instead of Text for better visibility
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
    radius: 10 
    color: focused.id == modelData || mouseAreaWs.containsMouse ? "#9e631e" : "transparent"  // Highlight active workspace

    Behavior on color {
            ColorAnimation { duration: 150 }
    }
    Text {
      anchors.centerIn: parent
      text: {
        return modelData
      }
      color: ThemeItem.workspaceNoColour
      font.pixelSize: 11

    }
    MouseArea{
      id:mouseAreaWs
      width:parent.width
      height: parent.height
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      onClicked:{
        HyprUtils.switchWs(modelData);
      }
    }
  }
}
