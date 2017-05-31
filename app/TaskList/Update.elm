module TaskList.Update exposing (..)

import TaskList.Msg
import Task.Model
import TaskList.Model
import String


update : TaskList.Msg.Msg -> TaskList.Model.Model -> TaskList.Model.Model
update msg taskList =
    case msg of
        TaskList.Msg.Add id description ->
            if String.isEmpty description then
                taskList
            else
                taskList ++ [ Task.Model.newTask id description ]

        TaskList.Msg.Delete id ->
            List.filter (\t -> t.id /= id) taskList



--TaskList.Msg.DeleteComplete ->
--  List.filter (not << .completed) taskList
--TaskList.Msg.CheckAll isCompleted ->
--  let
--    updateTask t =
--      Task.Update.updateTask (Check isCompleted) t
--  in
--    List.map updateTask taskList
