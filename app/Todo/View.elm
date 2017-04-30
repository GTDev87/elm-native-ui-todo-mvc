module Todo.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)
import Task.Model as Task

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
import Todo.Msg exposing (..)
import Todo.Model exposing (Model)

import Task.TaskEntryView as TaskEntryView
import TaskList.View

--import TaskEntry.View as TaskEntryView
import Control.View as ControlView
--import InfoFooter.View exposing (infoFooter)





infoFooter : Node Msg
infoFooter =
  Elements.view []
    [ Elements.text [] [ Ui.string "Double-click to edit a todo" ]
    , Elements.text [] [ Ui.string "Written by Evan Czaplicki" ]
    , Elements.text [] [ Ui.string "Part of TodoMVC" ]
    ]

view : Model -> Node Msg
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
        [ TaskEntryView.taskEntry taskEntry
        , TaskList.View.view control.visibility taskList
        , ControlView.view control.visibility taskList
        ]
      , infoFooter
      ]
