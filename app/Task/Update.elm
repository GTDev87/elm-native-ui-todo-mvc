module Task.Update exposing (..)

import Todo.Msg
import Task.Msg
--import Msg.TaskList exposing (..)
import Task.Model


update : Todo.Msg.Msg -> Task.Model.Model -> Task.Model.Model
update msgFor task =
  case msgFor of
    Todo.Msg.MsgForTaskEntry msg ->
      updateTask msg task

    --MsgForTask _ msg ->
    --  updateTask msg task

    --MsgForTaskList (Add id _) ->
    --    Task.Model.newTask (id + 1) ""

    _ ->
      task

updateTask : Task.Msg.Msg -> Task.Model.Model -> Task.Model.Model
updateTask msg model =
  case msg of
    --Check isCompleted ->
    --  { model | completed = isCompleted }

    --Editing isEditing ->
    --  { model | editing = isEditing }

    Task.Msg.Update description ->
      { model | description = description }