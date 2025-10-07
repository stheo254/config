pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Mpris

import qs
import qs.bar.utils

Rectangle{
  property int elemWidth
  property int elemHeight
  property int idx 
  width: elemWidth
  height: elemHeight
  radius: 10
  Layout.leftMargin : 5
  Layout.rightMargin : 5
  Layout.topMargin: 5
  color: ThemeItem.barBgColour
  ColumnLayout{
    anchors.centerIn: parent
    Rectangle{
      anchors.horizontalCenter: parent.horizontalCenter
      width : 200
      height: 30
      color: "transparent"
      RowLayout{
        anchors.centerIn : parent
        spacing:5
        Rectangle{
          width:30
          height:30
          color:"transparent"
          radius: 20
          IconImage {
            id: iconVol
            implicitSize:30
            source: "file:///home/stheo/.config/quickshell/icons/chevron_left.svg"
          }
          MouseArea{
            id:mouseAreaMedia
            anchors.centerIn: parent
            width:parent.width
            height: parent.height
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:{
              let tmp = idx - 1
              if(tmp < 0){
                idx = MediaUtils.media.length - 1
              }else{
                idx = tmp
              }
            }
          }
        }
        Rectangle{
          id: xdxdxd
          width:125
          color:"transparent"
          height:30
          Text{
            anchors.centerIn: parent
            id:titleText
            text:MediaUtils.media.length == 0 ? "Nothing Playing" : MediaUtils.media[idx].identity
            font.pixelSize: 15
            color: ThemeItem.text
          }
        }
        Rectangle{
          width:30
          height:30
          radius: 20
          color:"transparent"
          IconImage {
            id: iconVolRight
            implicitSize:30
            source: "file:///home/stheo/.config/quickshell/icons/chevron_right.svg"
          }
          MouseArea{
            id:mouseAreaMediaRight
            anchors.centerIn: parent
            width:parent.width
            height: parent.height
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:{
              let tmp = idx + 1
              if(tmp > MediaUtils.media.length - 1){
                idx = 0
              }else{
                idx = tmp
              }
            }
          }
      }
    }
  }
    Rectangle{
      id: inhalt
      width : elemWidth -10
      height: elemHeight - 50
      color: ThemeItem.barScndBgColour
      radius: 10
      RowLayout{
        anchors.centerIn : parent
        spacing:5
        Rectangle{
          width: 85
          height: 85
          color: "transparent"
          IconImage{
            id: trackArt
            implicitSize: 90
            source:MediaUtils.media[idx].trackArtUrl == "" ?  "file:///home/stheo/.config/quickshell/icons/metal-gear-0.png": MediaUtils.media[idx].trackArtUrl 
          }
        }
        Rectangle{
          width: elemWidth - 180
          height: elemHeight - 60
          Layout.leftMargin: 10
          color:"transparent"
          ColumnLayout{
            anchors.verticalCenter: parent.verticalCenter
            Text{
              font.pixelSize: 15
              width: elemWidth -100
              height: 20
              maximumLineCount:1
              elide: Text.ElideRight
              color: ThemeItem.text
              text: MediaUtils.media[idx].trackTitle
            }
            Text{
              font.pixelSize: 15
              color: ThemeItem.text
              text: MediaUtils.media[idx].trackArtist
            }
            RowLayout{
              Rectangle{
                width: 30
                height: 30
                radius: 20
                color:mousePrevSong.containsMouse ? ThemeItem.workspaceNoColour :"transparent"
                IconImage {
                  id: iconPrevSong
                  implicitSize:30
                  source: "file:///home/stheo/.config/quickshell/icons/skip_previous.svg"
                }
                MouseArea{
                  id:mousePrevSong
                  anchors.centerIn: parent
                  width:parent.width
                  height: parent.height
                  hoverEnabled: true
                  cursorShape: Qt.PointingHandCursor
                  onClicked:{
                    MediaUtils.media[idx].previous()
                    }
                  }
                }
              Rectangle{
                width: 30
                height: 30
                radius: 20
                color:mousePauseSong.containsMouse ? ThemeItem.workspaceNoColour : "transparent"
                IconImage {
                  id: iconPauseSong
                  implicitSize:30
                  source: "file:///home/stheo/.config/quickshell/icons/play_pause.svg"
                }
                MouseArea{
                  id:mousePauseSong
                  anchors.centerIn: parent
                  width:parent.width
                  height: parent.height
                  hoverEnabled: true
                  cursorShape: Qt.PointingHandCursor
                  onClicked:{
                    MediaUtils.media[idx].togglePlaying()
                    }
                  }
              }
              Rectangle{
                width: 30
                height: 30
                radius: 20
                color:mouseNextSong.containsMouse ? ThemeItem.workspaceNoColour : "transparent"
                IconImage {
                  id: iconNextSong
                  implicitSize:30
                  source: "file:///home/stheo/.config/quickshell/icons/skip_next.svg"
                }
                MouseArea{
                  id:mouseNextSong
                  anchors.centerIn: parent
                  width:parent.width
                  height: parent.height
                  hoverEnabled: true
                  cursorShape: Qt.PointingHandCursor
                  onClicked:{
                    MediaUtils.media[idx].next()
                    }
                  }
                }
            }
          }
        }
      }
    }
    Rectangle{
    }
  }
}
