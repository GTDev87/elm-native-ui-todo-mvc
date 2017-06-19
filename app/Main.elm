port module Main exposing (..)

import NativeUi
import Todo.View
import Todo.Model
import Todo.Msg
import Todo.Update
import NavigationAndroid.Update
import Task
import NavigationAndroid.Types


updateCmd : NavigationAndroid.Types.TabPort -> Todo.Msg.Msg -> Cmd Todo.Msg.Msg
updateCmd porttype msg =
    Cmd.batch
        [ NavigationAndroid.Update.updateCmd porttype msg
        ]


updateWithCmd : NavigationAndroid.Types.TabPort -> Todo.Msg.Msg -> Todo.Model.Model -> ( Todo.Model.Model, Cmd Todo.Msg.Msg )
updateWithCmd porttype msg model =
    ( Todo.Update.update msg model, updateCmd porttype msg )


port somePort : Bool -> Cmd msg


main : Program Never Todo.Model.Model Todo.Msg.Msg
main =
    NativeUi.program
        { init = Todo.Model.init
        , view = Todo.View.view
        , update = (\msg model -> updateWithCmd somePort msg model)
        , subscriptions = \_ -> Sub.none
        }
