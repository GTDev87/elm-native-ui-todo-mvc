module Todo.Update exposing (..)

import Todo.Msg
import TaskList.Msg

import Todo.Model
import Task.Model
import TaskList.Model
import Control.Model

import Task.Update
import TaskList.Update
import Control.Update

updateTaskList : Todo.Msg.Msg -> TaskList.Model.Model -> TaskList.Model.Model
updateTaskList msgFor taskList =
  case msgFor of
    Todo.Msg.MsgForTaskList msg ->
      TaskList.Update.update msg taskList

    Todo.Msg.MsgForTask id msg ->
      let
        updateTaskFn task =
          if task.id == id then
            Task.Update.update msg task
          else
            task
      in
        List.map updateTaskFn taskList

    _ ->
      taskList

updateEntry : Todo.Msg.Msg -> Task.Model.Model -> Task.Model.Model
updateEntry msgFor task =
  case msgFor of
    Todo.Msg.MsgForTaskEntry msg ->
      Task.Update.update msg task

    Todo.Msg.MsgForTaskList (TaskList.Msg.Add id _) ->
      Task.Model.newTask (id + 1) ""

    _ ->
      task

updateControl : Todo.Msg.Msg -> Control.Model.Model -> Control.Model.Model
updateControl msgFor control =
  case msgFor of
    Todo.Msg.MsgForControl msg ->
      Control.Update.update msg control
    _ ->
      control

update : Todo.Msg.Msg -> Todo.Model.Model -> ( Todo.Model.Model, Cmd Todo.Msg.Msg )
update msg model =
  ({ model
    | taskEntry = updateEntry msg model.taskEntry
    , taskList = updateTaskList msg model.taskList
    , control = updateControl msg model.control
  }, Cmd.none)
