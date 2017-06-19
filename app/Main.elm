port module Main exposing (..)

import NativeUi
import Todo.View
import Todo.Model
import Todo.Msg
import Todo.Update
import Task


updateWithCmd : Todo.Msg.Msg -> Todo.Model.Model -> ( Todo.Model.Model, Cmd Todo.Msg.Msg )
updateWithCmd msg model =
    ( Todo.Update.update msg model, Cmd.none )


main : Program Never Todo.Model.Model Todo.Msg.Msg
main =
    NativeUi.program
        { init = Todo.Model.init
        , view = Todo.View.view
        , update = (\msg model -> updateWithCmd msg model)
        , subscriptions = \_ -> Sub.none
        }
