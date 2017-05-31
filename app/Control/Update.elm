module Control.Update exposing (..)

import Control.Msg
import Control.Model


update : Control.Msg.Msg -> Control.Model.Model -> Control.Model.Model
update msg model =
    case msg of
        Control.Msg.ChangeVisibility visibility ->
            { model | visibility = visibility }
