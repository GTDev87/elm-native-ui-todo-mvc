module TaskList.Update exposing (..)

import Todo.Msg
import Task.Msg

import TaskList.Msg
import Task.Model
import TaskList.Model
import Task.Update
import String


update : Todo.Msg.Msg -> TaskList.Model.Model -> TaskList.Model.Model
update msgFor taskList =
  case msgFor of
    Todo.Msg.MsgForTaskList msg ->
      updateTaskList msg taskList

    --MsgForTask id msg ->
    --  updateTask id msg taskList

    _ ->
      taskList


updateTaskList : TaskList.Msg.Msg -> TaskList.Model.Model -> TaskList.Model.Model
updateTaskList msg taskList =
  case msg of
    TaskList.Msg.Add id description ->
      if String.isEmpty description then
        taskList
      else
        taskList ++ [ Task.Model.newTask id description ]

    --TaskList.Msg.Delete id ->
    --  List.filter (\t -> t.id /= id) taskList

    --TaskList.Msg.DeleteComplete ->
    --  List.filter (not << .completed) taskList

    --TaskList.Msg.CheckAll isCompleted ->
    --  let
    --    updateTask t =
    --      Task.Update.updateTask (Check isCompleted) t
    --  in
    --    List.map updateTask taskList


updateTask : Int -> Task.Msg.Msg -> TaskList.Model.Model -> TaskList.Model.Model
updateTask id msg taskList =
  let
    updateTask task =
      if task.id == id then
        Task.Update.updateTask msg task
      else
        task
  in
    List.map updateTask taskList