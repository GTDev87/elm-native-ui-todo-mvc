module Task.TaskEntryView exposing (..)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Style as Style

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
import Todo.Msg as Todo exposing (..)
import NativeUi as Ui exposing (Node)
--import Msg.TaskList exposing (..)
--import Msg.Task exposing (..)
--import View.Events exposing (onEnter)
import Task.Model exposing (Model)
--import Json.Decode as Json


taskEntry : Task.Model.Model -> Node Todo.Msg
taskEntry taskEntry =
  Elements.view
    []
    [ Elements.text
      []
      [ Ui.string "todos" ]

    , Elements.textInput
      [ Ui.style 
        [ Style.width 80
        , Style.height 80
        ]
      --, constantMsgEvent "onChangeText" (MsgForTaskList <| Add taskEntry.id taskEntry.description)
      --, onSubmitEditing NoOp (MsgForTaskList <| Add taskEntry.id taskEntry.description)
      ]
      []
    , Elements.text
      []
      [ Ui.string "After todos" ]
    ]

  --header [ id "header" ]
  --  [ h1 [] [ text "todos" ]
  --  , input
  --    [ id "new-todo"
  --    , placeholder "What needs to be done?"
  --    , autofocus True
  --    , value taskEntry.description
  --    , name "newTodo"
  --    , on "input" (Json.map (MsgForTaskEntry << Update) targetValue)
  --    , onEnter NoOp (MsgForTaskList <| Add taskEntry.id taskEntry.description)
  --    ]
  --    []
  --  ]