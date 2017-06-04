module Task.View exposing (..)

import NativeUi
import NativeUi.Elements
import NativeUi.Properties
import NativeUi.Events
import NativeUi.Style
import SwipeoutView.SwipeoutView
import Json.Encode
import Json.Decode
import Todo.Msg
import Task.Msg
import TaskList.Msg
import Task.Model
import Image.Image


editingView : Task.Model.Model -> NativeUi.Node Todo.Msg.Msg
editingView task =
    NativeUi.Elements.view
        []
        [ NativeUi.Elements.textInput
            [ NativeUi.style
                [ NativeUi.Style.fontSize 24
                , NativeUi.Style.paddingBottom 15
                , NativeUi.Style.paddingTop 1
                , NativeUi.Style.marginLeft 10
                , NativeUi.Style.width 100
                , NativeUi.Style.height 60
                ]
            , NativeUi.property "autoCorrect" (Json.Encode.bool True)
            , NativeUi.property "autoFocus" (Json.Encode.bool True)
            , NativeUi.property "value" (Json.Encode.string task.description) -- maybe get rid of this... but leave an inital value somehow
            , NativeUi.on "onChangeText" (Json.Decode.map (Todo.Msg.MsgForTask (Debug.log "task.id" task.id) << Task.Msg.Update) Json.Decode.string)
            , NativeUi.on "onEndEditing" (Json.Decode.succeed (Todo.Msg.MsgForTask task.id <| Task.Msg.Editing False))
            , NativeUi.on "onBlur" (Json.Decode.succeed (Todo.Msg.MsgForTask task.id <| Task.Msg.Editing False))
            , NativeUi.on "onSubmitEditing" (Json.Decode.succeed (Todo.Msg.MsgForTask task.id <| Task.Msg.Editing False))
            ]
            []
        ]


textView : Task.Model.Model -> NativeUi.Node Todo.Msg.Msg
textView task =
    let
        labelCompletedStyling =
            if task.completed then
                [ NativeUi.Style.textDecorationLine "line-through" ]
            else
                []
    in
        NativeUi.Elements.text
            [ NativeUi.style
                ([ NativeUi.Style.fontSize 24 -- label
                 , NativeUi.Style.paddingBottom 15
                 , NativeUi.Style.paddingTop 1
                 , NativeUi.Style.marginLeft 10
                 ]
                    ++ labelCompletedStyling
                )
            ]
            [ NativeUi.string task.description ]


view : Task.Model.Model -> NativeUi.Node Todo.Msg.Msg
view task =
    let
        viewDisabledStyles =
            if task.completed then
                [ NativeUi.Style.opacity 0.5 ]
            else
                []

        checkBox =
            Image.Image.imgSrc
                (if task.completed then
                    "checked"
                 else
                    "unchecked"
                )

        editView =
            if task.editing then
                editingView task
            else
                textView task
    in
        SwipeoutView.SwipeoutView.view
            [ SwipeoutView.SwipeoutView.backgroundColor "transparent"
            , SwipeoutView.SwipeoutView.right
                [ SwipeoutView.SwipeoutView.stringProp "text" "delete"
                , SwipeoutView.SwipeoutView.stringProp "backgroundColor" "red"
                ]
            , SwipeoutView.SwipeoutView.onRightSwipe (TaskList.Msg.Delete task.id |> Todo.Msg.MsgForTaskList)
            , SwipeoutView.SwipeoutView.autoClose True
            ]
            [ NativeUi.Elements.touchableOpacity
                [ NativeUi.Events.onPress (Todo.Msg.MsgForTask task.id <| Task.Msg.Check (not task.completed))
                , NativeUi.Events.onLongPress (Todo.Msg.MsgForTask task.id <| Task.Msg.Editing (not task.editing))
                , NativeUi.Properties.underlayColor "transparent"
                ]
                [ NativeUi.Elements.view
                    [ NativeUi.style
                        -- item
                        ([ NativeUi.Style.borderBottomWidth 1
                         , NativeUi.Style.borderBottomColor "#ededed"
                         , NativeUi.Style.flexDirection "row"
                         , NativeUi.Style.paddingTop 15
                         , NativeUi.Style.paddingRight 60
                         ]
                            ++ viewDisabledStyles
                        )
                    ]
                    [ NativeUi.Elements.image
                        [ NativeUi.style
                            [ NativeUi.Style.marginLeft 10 -- checkbox
                            , NativeUi.Style.marginTop 3
                            ]
                        , Image.Image.localSource checkBox
                        ]
                        []
                    , NativeUi.Elements.view
                        [ NativeUi.style
                            [ NativeUi.Style.flex 1 -- labelWrapper
                            , NativeUi.Style.flexDirection "column"
                            , NativeUi.Style.alignItems "flex-start"
                            ]
                        ]
                        [ editView ]
                    ]
                ]
            ]
