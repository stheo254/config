// shell.qml
//@ pragma UseQApplication
import Quickshell
import qs.bar

Scope {
  Bar {}
  LazyLoader{
    loading: true
    MediaControls{}
  }
}
