module Task.Update exposing (..)

import Todo.Msg
import Task.Msg
import TaskList.Msg
import Task.Model


update : Todo.Msg.Msg -> Task.Model.Model -> Task.Model.Model
update msgFor task =
  case msgFor of
    Todo.Msg.MsgForTaskEntry msg ->
      updateTask msg task

    Todo.Msg.MsgForTask _ msg ->
      updateTask msg task

    Todo.Msg.MsgForTaskList (TaskList.Msg.Add id _) ->
      Task.Model.newTask (id + 1) ""

    _ ->
      task

updateTask : Task.Msg.Msg -> Task.Model.Model -> Task.Model.Model
updateTask msg model =
  case msg of
    Task.Msg.Check isCompleted ->
      { model | completed = isCompleted }

    Task.Msg.Editing isEditing ->
      { model | editing = isEditing }

    Task.Msg.Update description ->
      { model | description = description }