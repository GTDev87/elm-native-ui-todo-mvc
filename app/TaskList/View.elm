module TaskList.View exposing (..)

import NativeUi.Elements
import NativeUi

import TaskList.Model
import Task.View
import Todo.Msg
import NativeUi.Style

--import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView
--import Control.View as ControlView
--import InfoFooter.View exposing (infoFooter)

view : String -> TaskList.Model.Model -> NativeUi.Node Todo.Msg.Msg
view visibility tasks =
  let
    isVisible todo =
      case visibility of
        "Completed" ->
          todo.completed

        "Active" ->
          not todo.completed

        _ ->
          True

    allCompleted =
      List.all .completed tasks

    cssVisibility =
      if List.isEmpty tasks then
        "hidden"
      else
        "visible"
  in
    --section
    --  [ id "main"
    --  , style [ ( "visibility", cssVisibility ) ]
    --  ]
    --  [ input
    --    [ id "toggle-all"
    --    , type' "checkbox"
    --    , name "toggle"
    --    , checked allCompleted
    --    , onClick (MsgForTaskList <| CheckAll (not allCompleted))
    --    ]
    --    []
    --  , label [ for "toggle-all" ]
    --    [ text "Mark all as complete" ]
    --  , ul [ id "todo-list" ]
    --    (List.map todoItem (List.filter isVisible tasks))
    --  ]
    NativeUi.Elements.view
      []
      [ NativeUi.Elements.scrollView
        []
        (List.map Task.View.view (List.filter isVisible tasks))
      ]
