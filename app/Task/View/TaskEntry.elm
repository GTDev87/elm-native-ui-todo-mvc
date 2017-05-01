module Task.View.TaskEntry exposing (..)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Style as Style
import NativeUi.Events as Events

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
import Todo.Msg as Todo exposing (..)
import NativeUi as Ui exposing (Node)
import Task.Msg exposing (..)

--import Msg.TaskList exposing (..)
--import Msg.Task exposing (..)
--import View.Events exposing (onEnter)
import Task.Model exposing (Model)
import Json.Decode as Decode
import Json.Encode as Encode


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
      , Ui.property "value" (Encode.string taskEntry.description)
      --, Events.constantMsgEvent "onChangeText" (Json.map (MsgForTaskEntry << Update))
      , Ui.on "onChangeText" (Decode.map (MsgForTaskEntry << Update) Decode.string)

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