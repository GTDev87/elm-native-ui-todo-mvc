module Task.Update exposing (..)

import Todo.Msg as Todo exposing (..)
import Task.Msg as Msg exposing (..)
--import Msg.TaskList exposing (..)
import Task.Model exposing (Model, newTask)


update : Todo.Msg -> Model -> Model
update msgFor task =
  case msgFor of
    MsgForTaskEntry msg ->
      updateTask msg task

    --MsgForTask _ msg ->
    --  updateTask msg task

    --MsgForTaskList (Add id _) ->
    --    newTask (id + 1) ""

    _ ->
      task

updateTask : Msg.Msg -> Model -> Model
updateTask msg model =
  case msg of
    --Check isCompleted ->
    --  { model | completed = isCompleted }

    --Editing isEditing ->
    --  { model | editing = isEditing }

    Msg.Update description ->
      { model | description = description }