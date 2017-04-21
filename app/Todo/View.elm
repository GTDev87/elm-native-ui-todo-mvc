module Todo.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)
import Task.Model as Task

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
import Todo.Msg exposing (..)
import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView
--import Controls.View as ControlsView
--import InfoFooter.View exposing (infoFooter)

todoItem : Task.Model -> Node Msg
todoItem todo =
  --li [ classList [ ( "completed", todo.completed ), ( "editing", todo.editing ) ] ]
  --  [ div [ class "view" ]
  --    [ input
  --      [ class "toggle"
  --      , type' "checkbox"
  --      , checked todo.completed
  --      , onClick (MsgForTask todo.id <| Check (not todo.completed))
  --      ]
  --      []
  --    , label [ onDoubleClick (MsgForTask todo.id <| Editing True) ]
  --      [ text todo.description ]
  --    , button
  --      [ class "destroy"
  --      , onClick (MsgForTaskList <| Delete todo.id)
  --      ]
  --      []
  --    ]
  --  , input
  --    [ class "edit"
  --    , value todo.description
  --    , name "title"
  --    , id ("todo-" ++ toString todo.id)
  --    , on "input" (Json.map (MsgForTask todo.id << Update) targetValue)
  --    , onBlur (MsgForTask todo.id <| Editing False)
  --    , onEnter NoOp (MsgForTask todo.id <| Editing False)
  --    ]
  --    []
  --  ]

  Elements.view []
    [ Elements.view []
      [ Elements.touchableHighlight
        []
        []
      , Elements.view []
        [ Ui.string todo.description ]
      , Elements.text
        []
        []
      ]
    , Elements.textInput
      []
      []
    ]

todoTaskList : String -> List Task.Model -> Node Msg
todoTaskList visibility tasks =
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
      [ Elements.touchableHighlight
        []
        []
      , Elements.view []
        [ Ui.string "Mark all as complete" ]
      , Elements.view []
        (List.map todoItem (List.filter isVisible tasks))
      ]

view : Model -> Node Msg
view model =
  let
    taskList =
      model.taskList

    --taskEntry =
    --  model.taskEntry

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
        [ 
        --lazy TaskEntryView.taskEntry taskEntry
        --, 
          todoTaskList control.visibility taskList
        --, lazy2 ControlsView.controls control.visibility taskList
        ]
      --, infoFooter
      ]
