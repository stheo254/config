// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Mpris

import qs

Item{
  id:mediaBar
  //shows spotify in the bar and m1 for previous m2 for next and m3 for pause
  //if nothing is playing show "no songs plying"
  //plans: if hovered open a media controller
  //
  property var players : Mpris.players.values
  implicitWidth: spotifyTitles.implicitWidth + 40
  Text{
    id:spotifyTitles
    anchors.centerIn:parent
    color: ThemeItem.workspaceNoColour
    text: textLoader()
    function textLoader(){
      let spotifyMpris 
      for(var player of players){
        if(player.identity == "Spotify"){
          spotifyMpris = player
          return "󰎇  " + spotifyMpris.trackTitle + " - " + spotifyMpris.trackArtist
        }
      }
      return "󰎇  Nothing is Playing"
      }
  }
  MouseArea{
      id:mouseAreaMedia
      anchors.centerIn: parent
      width:parent.width
      height: parent.height
      hoverEnabled: true
      onClicked:{
        console.log("click")
      }
      onEntered:{
        console.log("hover")
      }
      onExited:{
      }
    }
}
