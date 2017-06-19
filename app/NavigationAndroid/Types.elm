module NavigationAndroid.Types exposing (..)

import Todo.Msg


type alias TabPort =
    Bool -> Cmd Todo.Msg.Msg
