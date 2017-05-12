module Todo.View exposing (..)

import NativeApi.Platform
import NativeUi
import NativeUi.Elements
import NativeUi.Style

import Todo.Msg
import Todo.Model

import Task.View.TaskEntry
import TaskList.View
import Control.View

--import TaskEntry.View as TaskEntryView
--import InfoFooter.View exposing (infoFooter)


infoFooter : NativeUi.Node Todo.Msg.Msg
infoFooter =
  NativeUi.Elements.view []
    [ NativeUi.Elements.text [] [ NativeUi.string "Double-click to edit a todo" ]
    , NativeUi.Elements.text [] [ NativeUi.string "Written by Evan Czaplicki" ]
    , NativeUi.Elements.text [] [ NativeUi.string "Part of TodoMVC" ]
    ]

view : Todo.Model.Model -> NativeUi.Node Todo.Msg.Msg
view model =
  let
    taskList =
      model.taskList

    taskEntry =
      model.taskEntry

    control =
      model.control
  in
    NativeUi.Elements.view
    [ NativeUi.style [NativeUi.Style.flex 1] ]
    [ NativeUi.Elements.view
      []
      [ NativeUi.Elements.view
        []
        [ NativeUi.Elements.view [ ]
          [ Task.View.TaskEntry.taskEntry taskEntry
          , TaskList.View.view control.visibility taskList
          , Control.View.view control.visibility taskList
          ]
        , infoFooter
        ]
      ]
    ]


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
    
