// Bar.qml
import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray

import qs
import qs.bar.utils

Item{
  id:systrayRoot
//steam: file://(path)/steamtraaymono
  required property SystemTrayItem modelData
  implicitWidth :20 
  implicitHeight:20 
  IconImage{
    id:systrayIcon
    anchors.centerIn: parent
    implicitSize: 16
    source:{
      let icon = modelData.icon
      if(icon.includes("?path=")){
        let modSplit = icon.split("?path=");
        let b = modSplit[0].split("/")
        icon = `file://${modSplit[modSplit.length - 1]}/${b[b.length-1]}`
      }
      return icon
    }
  }
    MouseArea{
      id:sysMouse
      implicitWidth: parent.implicitWidth
      implicitHeight: parent.implicitHeight
      hoverEnabled: true
      acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt. MiddleButton
      onClicked:(mouse) => {
        switch(mouse.button){
          case Qt.LeftButton:
          modelData.activate();
          break;
          case Qt.RightButton:
          //open menu
          sysMenu.open();
          break;

        }
      }
    }
    QsMenuAnchor{
      id:sysMenu
      menu: systrayRoot.modelData.menu
      anchor.window : systrayRoot.QsWindow.window;
      anchor.adjustment: PopupAdjustment.Flip

      anchor.onAnchoring: {
        const window = systrayRoot.QsWindow.window;
        const widgetRect = window.contentItem.mapFromItem(systrayRoot, 0, systrayRoot.height, systrayRoot.width, systrayRoot.height);
        sysMenu.anchor.rect = widgetRect;
      }
    }
  }
