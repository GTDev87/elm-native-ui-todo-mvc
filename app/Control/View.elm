module Control.View exposing (..)

import NativeApi.Platform
import NativeUi
import NativeUi.Elements
import Control.View.NavigationIOS
import Control.View.NavigationAndroid
import NativeUi.Style
import Task.Model
import Todo.Msg
import Control.Model
import Control.View.Navigation


type alias Props =
    { visibility : Control.Model.VisibilityType
    , todoEntryNode : NativeUi.Node Todo.Msg.Msg
    , taskList : List Task.Model.Model
    }


view : Control.Model.Model -> Props -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view model props children =
    let
        tasks =
            props.taskList

        tasksCompleted =
            List.length (List.filter .completed tasks)

        tasksLeft =
            List.length tasks - tasksCompleted

        item_ =
            if tasksLeft == 1 then
                " item"
            else
                " items"

        isIos =
            NativeApi.Platform.os == NativeApi.Platform.IOS

        navigation =
            if isIos then
                Control.View.NavigationIOS.view
            else
                Control.View.NavigationAndroid.view
    in
        NativeUi.Elements.view
            [ NativeUi.style
                [ NativeUi.Style.flex 1 ]
            ]
            [ if isIos then
                props.todoEntryNode
              else
                NativeUi.Elements.view [] []
            , navigation
                model
                { tabTypes = Control.View.Navigation.tabTypes }
                children
            ]
