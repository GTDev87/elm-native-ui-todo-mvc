module Task.View.TaskEntry exposing (..)
import NativeUi.Elements
import NativeUi.Style
import NativeUi.Events

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
import NativeUi


--import Msg.TaskList exposing (..)
--import Msg.Task exposing (..)
--import View.Events exposing (onEnter)
import Task.Model
import TaskList.Msg
import Task.Msg
import Todo.Msg
import Json.Decode as Decode
import Json.Encode as Encode


taskEntry : Task.Model.Model -> NativeUi.Node Todo.Msg.Msg
taskEntry taskEntry =
  NativeUi.Elements.view
    []
    [ NativeUi.Elements.textInput
      [ NativeUi.style
        [ NativeUi.Style.paddingLeft 15
        , NativeUi.Style.height 60
        , NativeUi.Style.borderWidth 1
        , NativeUi.Style.borderColor "#ededed"
        ]
      , NativeUi.property "value" (Encode.string taskEntry.description)
      , NativeUi.property "placeholder" (Encode.string "What needs to be done?")
      , NativeUi.on "onChangeText" (Decode.map (Todo.Msg.MsgForTaskEntry << Task.Msg.Update) Decode.string)
      , NativeUi.on "onSubmitEditing" (Decode.succeed (Todo.Msg.MsgForTaskList <| TaskList.Msg.Add taskEntry.id taskEntry.description))
      ]
      []
    ]
