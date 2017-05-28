module Control.View.NavigationAndroid exposing (..)

import NativeUi.Elements
import NativeUi
import Todo.Msg

view : List (NativeUi.Property msg) -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view properties children =
  NativeUi.Elements.view
    []
    children
