module TaskList.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)

import TaskList.Model
import Task.View
import Todo.Msg

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)

--import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView
--import Control.View as ControlView
--import InfoFooter.View exposing (infoFooter)

view : String -> TaskList.Model.Model -> Node Todo.Msg.Msg
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
    Elements.view
      []
      [ Elements.touchableHighlight [] [Elements.view [] []]
      , Elements.text [] [ Ui.string "Mark all as complete" ]
      , Elements.view [] (List.map Task.View.view (List.filter isVisible tasks))
      ]