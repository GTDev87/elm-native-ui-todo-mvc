module Control.View.NavigationAndroid exposing (..)

import NativeUi.Elements
import NativeUi
import Todo.Msg

view : List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view children =
  NativeUi.Elements.view
    []
    children
