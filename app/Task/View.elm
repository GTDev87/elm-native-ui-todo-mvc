module Task.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)
import TaskList.Model as TaskList

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
import Todo.Msg exposing (..)
import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView
import Control.View as ControlView
import Task.Model
--import InfoFooter.View exposing (infoFooter)

view : Task.Model.Model -> Node Msg
view todo =
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
