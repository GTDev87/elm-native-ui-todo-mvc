module NavigationAndroid.Update exposing (..)

import NavigationAndroid.Types
import Todo.Msg


updateCmd : NavigationAndroid.Types.TabPort -> Todo.Msg.Msg -> Cmd a
updateCmd tabport msg =
    case msg of
        -- NEED TO ADD OPEN TAB HERE
        _ ->
            Cmd.none
