module Task.View.TaskEntry exposing (..)

import NativeUi.Elements
import NativeUi.Style
import NativeUi.Events
import NativeUi
import Task.Model
import TaskList.Msg
import Task.Msg
import Todo.Msg
import Json.Decode as Decode
import Json.Encode as Encode


type alias Props =
    { shouldEdit : Bool
    }


taskEntry : Task.Model.Model -> Props -> NativeUi.Node Todo.Msg.Msg
taskEntry taskEntry props =
    NativeUi.Elements.view
        []
        [ NativeUi.Elements.textInput
            [ NativeUi.style
                [ NativeUi.Style.paddingLeft 15
                , NativeUi.Style.height 60
                , NativeUi.Style.borderWidth 1
                , NativeUi.Style.borderColor "#ededed"
                ]
            , NativeUi.property "autoCorrect" (Encode.bool False)
            , NativeUi.property "editable" (Encode.bool props.shouldEdit)
            , NativeUi.property "value" (Encode.string taskEntry.description) -- set an initial value
            , NativeUi.property "placeholder" (Encode.string "What needs to be done?")
            , NativeUi.on "onChangeText" (Decode.map (Todo.Msg.MsgForTaskEntry << Task.Msg.Update) Decode.string)
            , NativeUi.on "onSubmitEditing" (Decode.succeed (Todo.Msg.MsgForTaskList <| TaskList.Msg.Add taskEntry.id taskEntry.description))
            ]
            []
        ]
