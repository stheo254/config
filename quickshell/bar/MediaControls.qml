import Quickshell.Widgets
import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Services.Mpris
import Quickshell.Services.Pipewire
import qs
import qs.bar.utils

Scope {
  // no more time object
  property bool visible: false
  PanelWindow {
    visible: GlobalStates.showMedia
    color : "transparent"
    anchors {
      top: true
      left: true
      bottom: true
      right: true
    }
    Rectangle{
      id:mediaContainer
      anchors.horizontalCenter: parent.horizontalCenter
      color: ThemeItem.barBgColour
      width: 800
      height: 300
      border.color: ThemeItem.barScndBgColour
      border.width: 2
      radius :10 
      Rectangle{
        id: mediaContainerMargin
        color: "transparent"
        width: mediaContainer.width 
        height: mediaContainer.height 
        RowLayout{
          id: mediaRowLay
          anchors.centerIn: parent
          spacing: 10
          Rectangle{
            id: sinkContainer
            implicitWidth: 200
            implicitHeight: 280
            color: ThemeItem.barScndBgColour
            radius: 5
            ColumnLayout{
              id:mediaSink
              spacing: 5
              Rectangle{
                id:sinkTitle
                color: "transparent"
                implicitWidth: sinkContainer.implicitWidth 
                implicitHeight:35 
                topLeftRadius: 10
                topRightRadius: 10
                Layout.alignment: Qt.AlignHCenter
                RowLayout{
                  id:sinkTitleElem
                  spacing:5
                  anchors.centerIn: parent
                  IconImage{
                    id:iconTitleSink
                    implicitSize:25 
                    source: "file:///home/stheo/.config/quickshell/icons/volume_high.svg"
                  }
                }
              }
              Repeater{
                id: elemSink
                model: PipewireUtils.sink 
                MediaSourcesBox{
                  elemWidth: sinkContainer.implicitWidth -10
                  elemHeight: 40
                  fontSizexd: 13
                }
              }
            }
          }
          Rectangle{
            implicitWidth: 360
            implicitHeight: 280
            color: ThemeItem.barScndBgColour
            radius: 10
            ColumnLayout{
              id:mediaChangerVol
              spacing:10
              MediaChanger{
                elemWidth: 350
                elemHeight: 180
              }
            }
          }
          Rectangle{
            id: sourceContainer
            implicitWidth: 200
            implicitHeight: 280
            color: ThemeItem.barScndBgColour
            radius: 5
            ColumnLayout{
              id:mediaSources
              spacing: 5
              Rectangle{
                id:sourceTitle
                color: "transparent"
                implicitWidth: sourceTitleElem.implicitWidth
                implicitHeight: 35
                Layout.alignment: Qt.AlignHCenter 
                RowLayout{
                  id:sourceTitleElem
                  spacing:5
                  anchors.centerIn: parent
                  IconImage{
                    id:iconTitleSource
                    implicitSize: 25
                    source: "file:///home/stheo/.config/quickshell/icons/mic_on.svg"
                  }
                }
              }
              Repeater{
                id: elemSource
                model: PipewireUtils.source 
                MediaSourcesBox{
                  elemWidth: sourceContainer.implicitWidth - 10
                  elemHeight: 40
                  fontSizexd :13
                }
              }
            }
          }
        }
      }
    }
  }
}
