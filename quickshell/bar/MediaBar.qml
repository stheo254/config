// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire

import qs
import qs.bar.utils

Item{
  id:mediaBar
  //shows spotify in the bar and m1 for previous m2 for next and m3 for pause
  //if nothing is playing show "no songs plying"
  //plans: if hovered open a media controller
  //
  PwObjectTracker{
    objects: [...Pipewire.nodes.values].filter(v => {
      return v.isSink;
    })
  }
  implicitWidth: spotifyTitles.implicitWidth + 40
  implicitHeight: spotifyTitles.implicitHeight
  Text{
    id:spotifyTitles
    anchors.centerIn:parent
    color: ThemeItem.workspaceNoColour
    text: MediaUtils.textLoader()
  }
  MouseArea{
      id:mouseAreaMedia
      anchors.centerIn: parent
      width:parent.width
      height: parent.height
      hoverEnabled: true
      cursorShape: Qt.PointingHandCursor
      acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton
      onClicked:(mouse) => {
        if(MediaUtils.spotifyPlayer == null){
          return
        }
        if (mouse.button == Qt.LeftButton){
          MediaUtils.spotifyPlayer.previous()
        }else if( mouse.button == Qt.RightButton){
          MediaUtils.spotifyPlayer.next()
        }else if( mouse.button == Qt.MiddleButton){
          MediaUtils.spotifyPlayer.togglePlaying()
        }
      }
      onEntered:{

        let x = Pipewire.defaultAudioSink
        console.log(x.description)
        console.log(x.audio.volume)
        // for(var y of x){
        //   console.log("start of loop " + y.description)
        //   console.log(y.name)
        //   console.log(y.isSink)
        //   console.log(y.type)
        // }
      }
    }
}
