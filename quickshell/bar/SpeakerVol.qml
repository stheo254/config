// Bar.qml
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire

import qs
import qs.bar.utils

Item{
  required property PwNode node

  implicitWidth: volumeProgress.implicitWidth 
  implicitHeight: volumeProgress.implicitHeight
  CircularProgress{
    id: volumeProgress
    anchors.centerIn: parent
    width: 20

    value: node.audio.volume
    //wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
    IconImage {
      id: iconVol
      implicitSize:20
      Layout.alignment: Qt.AlignRight
      source: {
        const default_sink = node;
        let icon_name = "volume_low.svg";
        if (!!default_sink && default_sink.isSink) {
          if (default_sink?.audio.muted) {
            icon_name = "volume_mute.svg";
          } else {
            if (default_sink?.audio.volume >= .5) {
              icon_name = "volume_high.svg";
            } else if (default_sink.audio.volume == 0) {
              icon_name = "volume_mute.svg";
            } else {
              icon_name = "volume_low.svg";
            }
          }
        }else if(!!default_sink && !default_sink.isSink){
          if (default_sink?.audio.muted) {
            icon_name = "mic_off.svg";
          } else {
            if (default_sink.audio.volume == 0) {
              icon_name = "mic_off.svg";
            } else {
              icon_name = "mic_on.svg";
            }
          }
        }

        return `file:///home/stheo/.config/quickshell/icons/${icon_name}`;
      }
    }
  }
  MouseArea{
    width: volumeProgress.width
    height: volumeProgress.width
    hoverEnabled: true
    onEntered:{
      audioTooltip.activateTooltip()
    }
    onExited: function () {
      audioTooltip.deactivateTooltip();
    }
    onWheel: function(event) {
      const default_sink = node;
      if (!default_sink) {
        return;
      }
      if (event.angleDelta.y > 0) {
        default_sink.audio.muted = false;
        default_sink.audio.volume += 0.05;
      } else if (event.angleDelta.y < 0) {
        default_sink.audio.muted = false;
        default_sink.audio.volume -= 0.05;
      }
    }
  }

  Tooltip{
    parentItem:parent
    id: audioTooltip
    Component{
      Rectangle{
        id: audioTooltipOutput
        color: ThemeItem.barScndBgColour
        opacity: 0
        radius: Variables.radius
        border.width: Variables.borderWidth
        border.color: ThemeItem.barBgColour
        width: audioTooltipText.width
        height: audioTooltipText.height
        Text {
          id: audioTooltipText
          anchors.centerIn: parent
          text: `${Math.round(node.audio.volume * 100)} %` || "0 %"
          font.pointSize: Variables.fontSizeTooltip
          padding: Variables.paddingTooltip
          color: ThemeItem.timeColour
        }
        Behavior on opacity {
          NumberAnimation {
            duration: 150
          }
        }
      }
    }
  }
}
