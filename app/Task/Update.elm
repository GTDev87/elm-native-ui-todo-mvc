module Task.Update exposing (..)

import Task.Msg
import Task.Model


update : Task.Msg.Msg -> Task.Model.Model -> Task.Model.Model
update msg model =
    case msg of
        Task.Msg.Check isCompleted ->
            { model | completed = isCompleted }

        Task.Msg.Editing isEditing ->
            { model | editing = isEditing }

        Task.Msg.Update description ->
            { model | description = description }
