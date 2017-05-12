module Task.View.TaskEntry exposing (..)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Style as Style
import NativeUi.Events as Events

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
import NativeUi as Ui exposing (Node)


--import Msg.TaskList exposing (..)
--import Msg.Task exposing (..)
--import View.Events exposing (onEnter)
import Task.Model
import TaskList.Msg
import Task.Msg
import Todo.Msg
import Json.Decode as Decode
import Json.Encode as Encode


taskEntry : Task.Model.Model -> Node Todo.Msg.Msg
taskEntry taskEntry =
  Elements.view
    []
    [ Elements.textInput
      [ Ui.style 
        [ Style.paddingLeft 15
        , Style.height 60
        , Style.borderWidth 1
        , Style.borderColor "#ededed"
        ]
      , Ui.property "value" (Encode.string taskEntry.description)
      , Ui.property "placeholder" (Encode.string "What needs to be done?")
      , Ui.on "onChangeText" (Decode.map (Todo.Msg.MsgForTaskEntry << Task.Msg.Update) Decode.string)
      , Ui.on "onSubmitEditing" (Decode.succeed (Todo.Msg.MsgForTaskList <| TaskList.Msg.Add taskEntry.id taskEntry.description))
      ]
      []
    ]