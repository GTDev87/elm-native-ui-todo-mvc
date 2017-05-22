module Todo.Update exposing (..)

import Todo.Model
import Todo.Msg

import Task.Update
import TaskList.Update
import Control.Update

update : Todo.Msg.Msg -> Todo.Model.Model -> ( Todo.Model.Model, Cmd Todo.Msg.Msg )
update msg model =
  ({ model
    | taskEntry = Task.Update.updateEntry msg model.taskEntry
    , taskList = TaskList.Update.update msg model.taskList
    , control = Control.Update.update msg model.control
  }, Cmd.none)
