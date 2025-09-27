pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick


Singleton{
  id:hyprUtils
  property list<HyprlandWorkspace> workspaces: filterNeg(sortWorkspaces(Hyprland.workspaces.values))

  function sortWorkspaces(ws) {
    return [...ws].sort((a, b) => a?.id - b?.id);
  }

  function filterNeg(ws){
    return [...ws].filter((a) => a.id >=0)
  }
  function switchWs(ws){
    Hyprland.dispatch(`workspace ${ws}`);
  }

}
