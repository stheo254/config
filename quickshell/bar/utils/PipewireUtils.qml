pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick

Singleton{
  id: pipewireUtils
  property var nodes: Pipewire.nodes.values
  property var sink: nodes.filter((x) => x.isSink && !x.isStream)
  property var source: nodes.filter((x) => !x.isSink && !x.isStream && x.audio != null)

}
