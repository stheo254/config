pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Services.SystemTray
import QtQuick


Singleton{
  id:systrayUtils
  property list<SystemTrayItem> systray: SystemTray.items.values
}
