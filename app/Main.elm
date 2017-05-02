module Main exposing (..)

import NativeUi
import Todo.View
import Todo.Model
import Todo.Msg
import Todo.Update

main : Program Never Todo.Model.Model Todo.Msg.Msg
main =
  NativeUi.program
    { init = Todo.Model.init
    , view = Todo.View.view
    , update = Todo.Update.update
    , subscriptions = \_ -> Sub.none
    }
