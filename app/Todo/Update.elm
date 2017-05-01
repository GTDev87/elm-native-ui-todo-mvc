module Todo.Update exposing (..)

import Todo.Model
import Todo.Msg

import Task.Update
import TaskList.Update

update : Todo.Msg.Msg -> Todo.Model.Model -> ( Todo.Model.Model, Cmd Todo.Msg.Msg )
update msg model =

  ({ model
    | taskEntry = Task.Update.update msg model.taskEntry
    , taskList = TaskList.Update.update msg model.taskList
    --, control = Control.update msg model.control
  }, Cmd.none)
  --case msg of
  --  Increment ->
  --    ( model + 1, Cmd.none )

  --  Decrement ->
  --    ( model - 1, Cmd.none )