module Todo.View exposing (..)

import NativeApi.Platform
import NativeUi
import NativeUi.Elements
import Native.NativeUi.Dimensions
import NativeUi.Style

import Todo.Msg
import Todo.Model
import Task.View.TaskEntry

import TaskList.View
import Control.View

--import TaskEntry.View as TaskEntryView

view : Todo.Model.Model -> NativeUi.Node Todo.Msg.Msg
view model =
  let
    taskList =
      model.taskList

    taskEntry =
      model.taskEntry

    control =
      model.control

    anyIsEditing =
      List.any (\t -> t.editing) model.taskList

    isIos =
      NativeApi.Platform.os == NativeApi.Platform.IOS

    platformStyles =
      if isIos then NativeUi.Style.marginTop 20 else NativeUi.Style.marginTop 0

  in
    NativeUi.Elements.view
    [ NativeUi.style
      [ NativeUi.Style.flex 1
      , platformStyles
      ]
    ]
    [ Control.View.view
      taskList
      control.visibility
      (Task.View.TaskEntry.taskEntry (not anyIsEditing) taskEntry)
      [ TaskList.View.view control.visibility taskList ]
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
    --  ]
    
