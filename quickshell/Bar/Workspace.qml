import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Item{
  property bool hoverWs : false
    width: 20
    height: 20
    
  Rectangle {  // Use Rectangle instead of Text for better visibility
    anchors.centerIn: parent
    width: parent.width
    height: parent.height
    radius: 10 
    color: modelData.focused || hoverWs ? "gray" : "transparent"  // Highlight active workspace

    Behavior on color {
            ColorAnimation { duration: 150 }
    }
    Text {
      anchors.centerIn: parent
      text: modelData.id || index + 1  // Use workspace ID or index
      color: "Black"
      font.pixelSize: 10
    }
    MouseArea{
      id:mouseAreaWs
      width:parent.width
      height: parent.height
      hoverEnabled: true
      onClicked:{
        HyprUtils.switchWs(modelData.id);
      }
      onEntered:{
        hoverWs = true 
      }
      onExited:{
        hoverWs = false
      }
    }
  }
}
