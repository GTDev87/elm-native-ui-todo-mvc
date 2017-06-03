module Control.View.NavigationAndroid exposing (..)

import NativeUi.Elements
import NativeUi
import Todo.Msg
import Control.View.Navigation
import Control.Model


view : Control.Model.Model -> Control.View.Navigation.Props -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view model props children =
    NativeUi.Elements.view
        []
        children
