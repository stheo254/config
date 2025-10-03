pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris
import QtQuick


Singleton{
  id:mediaUtils
  property list<MprisPlayer> media: Mpris.players.values
  property MprisPlayer spotifyPlayer: null

  function getSpotify(){
    for(var player of media){
      if(player.identity == "Spotify"){
        spotifyPlayer = player
        return true
      }
    }
    return false
  }

  function textLoader(){
    let x = true
    if(spotifyPlayer == null){
      x = getSpotify()
      console.log(x)
    }
    if(x == true){
      return "󰎇  " + spotifyPlayer.trackTitle + " - " + spotifyPlayer.trackArtist
    }else{
      return "󰎇  Nothing is Playing"
    }
  }


    
    //let spotifyMpris 
    //for(var player of media){
    //  if(player.identity == "Spotify"){
    //    spotifyMpris = player
    //    return "󰎇  " + spotifyMpris.trackTitle + " - " + spotifyMpris.trackArtist
    //  }
    //}
    //return "󰎇  Nothing is Playing"

}

