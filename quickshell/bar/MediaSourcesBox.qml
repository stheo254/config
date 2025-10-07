
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import qs
import qs.bar.utils

Rectangle{
  property int elemWidth
  property int elemHeight
  property int fontSizexd
  property bool hovered : false
  id: sourcesListElem
  width: elemWidth
  height: elemHeight
  radius: 10
  Layout.leftMargin : 5
  Layout.rightMargin : 5
  color: sinkControls.containsMouse ? ThemeItem.workspaceNoColour : ThemeItem.barBgColour

  Text{
    id:xddd
    anchors.right : parent
    anchors.verticalCenter : parent.verticalCenter
    elide: Text.ElideRight
    width: sourcesListElem.elemWidth
    padding: 10
    font.pixelSize: fontSizexd
    color: sinkControls.containsMouse  ? ThemeItem.textHighlighted: ThemeItem.text
    text:{
      return modelData.description
    }
  }
  MouseArea{
    id: sinkControls
    anchors.centerIn: parent
    width:parent.width
    height: parent.height
    hoverEnabled: true
    cursorShape: Qt.PointingHandCursor
    onEntered:{
      console.log(modelData.description)
      console.log(modelData.isSink && !modelData.isStream)
    }
    onClicked:{
      if(modelData.isSink && !modelData.isStream){
        Pipewire.preferredDefaultAudioSink = modelData
      }else if( !modelData.isSink && !modelData.isStream){
        Pipewire.preferredDefaultAudioSource = modelData
      }
    }
  }
}
