// Bar.qml
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

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      property var ws : [1,2,3,4,5,6]
      screen: modelData
      color:"transparent" 

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

      Rectangle{
        color: ThemeItem.barBgColour
        height: parent.height
        width: parent.width
        radius: 15 

        RowLayout{
          id:leftBlock
          width: 5 
          spacing: 4
          anchors.left : parent.left

          ModuleBlock{
            spacing:0
            margin: 3
            leftMargin:10 
            Repeater{
              id: ws
              model: generateWorkspaceModel()

              function generateWorkspaceModel() {
                let x = [1, 2, 3, 4, 5, 6];
                let f = HyprUtils.workspaces;
                for (let z of f) {
                  if (!x.includes(z.id)) {
                    x.push(z.id);
                  }
                }
                return x;
              }
              Workspace{}
            }
          }
          ModuleBlock{
            spacing: 1
            Repeater{
              id:systrayRepeater
              model:SystrayUtils.systray
              Systemtray{}
            }
          }

        }

        RowLayout{
          id: middleBlock
          spacing:2 
          anchors.horizontalCenter : parent.horizontalCenter
          ModuleBlock{
            margin:3

            SpeakerVol{
              node: Pipewire.defaultAudioSink
            }
          }
          ModuleBlock{
            margin:3

            MediaBar{}
          }
          ModuleBlock{
            margin:3

            SpeakerVol{
              node: Pipewire.defaultAudioSource
            }
          }
        }
        RowLayout{
          id: rightBlock
          spacing:2 
          anchors.right : parent.right
          ModuleBlock{
            height: parent.implicitHeight
            spacing: 0
            margin:3
            rightMargin:10
            
            ClockWidget {}
          }
        }
      }
    }
  }
}
