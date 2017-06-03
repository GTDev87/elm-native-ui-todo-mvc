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
            if isIos then
                NativeUi.Style.marginTop 20
            else
                NativeUi.Style.marginTop 0
    in
        NativeUi.Elements.view
            [ NativeUi.style
                [ NativeUi.Style.flex 1
                , platformStyles
                ]
            ]
            [ Control.View.view
                control
                { visibility = control.visibility
                , taskList = taskList
                , todoEntryNode =
                    Task.View.TaskEntry.taskEntry taskEntry { shouldEdit = not anyIsEditing }
                }
                [ TaskList.View.view
                    taskList
                    { visibility = control.visibility }
                ]
            ]
