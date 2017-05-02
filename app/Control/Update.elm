module Control.Update exposing (..)

import Todo.Msg
import Control.Msg
import Control.Model


update : Todo.Msg.Msg -> Control.Model.Model -> Control.Model.Model
update msgFor control =
  case msgFor of
    Todo.Msg.MsgForControl msg ->
      updateControl msg control
    _ ->
      control


updateControl : Control.Msg.Msg -> Control.Model.Model -> Control.Model.Model
updateControl msg model =
  case msg of
    Control.Msg.ChangeVisibility visibility ->
      { model | visibility = visibility }