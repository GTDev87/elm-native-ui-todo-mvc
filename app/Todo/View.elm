module Todo.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)


--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
import Todo.Msg
import Todo.Model

import Task.View.TaskEntry
import TaskList.View
import Control.View

--import TaskEntry.View as TaskEntryView
--import InfoFooter.View exposing (infoFooter)


infoFooter : Node Todo.Msg.Msg
infoFooter =
  Elements.view []
    [ Elements.text [] [ Ui.string "Double-click to edit a todo" ]
    , Elements.text [] [ Ui.string "Written by Evan Czaplicki" ]
    , Elements.text [] [ Ui.string "Part of TodoMVC" ]
    ]

view : Todo.Model.Model -> Node Todo.Msg.Msg
view model =
  let
    taskList =
      model.taskList

    taskEntry =
      model.taskEntry

    control =
      model.control
  in
    --div
    --  [ class "todomvc-wrapper"
    --  , style [ ( "visibility", "hidden" ) ]
    --  ]
    --  [ section [ id "todoapp" ]
    --    [ 
    --    --lazy TaskEntryView.taskEntry taskEntry
    --    --, 
    --      lazy2 taskList control.visibility taskList
    --    --, lazy2 ControlsView.controls control.visibility taskList
    --    ]
    --  --, infoFooter
    --  ]
    Elements.view
      [ ]
      [ Elements.view [ ]
        [ Task.View.TaskEntry.taskEntry taskEntry
        , TaskList.View.view control.visibility taskList
        , Control.View.view control.visibility taskList
        ]
      , infoFooter
      ]
