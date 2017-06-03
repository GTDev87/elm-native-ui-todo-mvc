module Control.View exposing (..)

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
--import Msg.Main as Main exposing (..)
--import Msg.TaskList exposing (..)
--import Msg.Control exposing (..)
--import Model.Task as Task

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


--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
--import Todo.Msg exposing (..)
--import Todo.Model exposing (Model)
--import TaskEntry.View as TaskEntryView
-- use props
--controls : String -> List Task.Model -> Html Main.Msg
--controls visibility tasks =
--  let
--    tasksCompleted =
--      List.length (List.filter .completed tasks)
--    tasksLeft =
--      List.length tasks - tasksCompleted
--    item_ =
--      if tasksLeft == 1 then
--        " item"
--      else
--        " items"
--  in
--    footer
--      [ id "footer"
--      , hidden (List.isEmpty tasks)
--      ]
--      [ span [ id "todo-count" ]
--        [ strong [] [ text (toString tasksLeft) ]
--        , text (item_ ++ " left")
--        ]
--      , ul [ id "filters" ]
--        [ visibilitySwap "#/" "All" visibility
--        , text " "
--        , visibilitySwap "#/active" "Active" visibility
--        , text " "
--        , visibilitySwap "#/completed" "Completed" visibility
--        ]
--      , button
--        [ class "clear-completed"
--        , id "clear-completed"
--        , hidden (tasksCompleted == 0)
--        , onClick (MsgForTaskList DeleteComplete)
--        ]
--        [ text ("Clear completed (" ++ toString tasksCompleted ++ ")") ]
--      ]


type alias Props =
    { visibility : Control.Model.VisibilityType
    , todoEntryNode : NativeUi.Node Todo.Msg.Msg
    , taskList : List Task.Model.Model
    }



--Image.Image.imgSrc "all"


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

            --, NativeUi.Elements.view
            --  [
            --    --id "todo-count"
            --  ]
            --  [ NativeUi.Elements.text [] [ NativeUi.string (toString tasksLeft) ]
            --  , NativeUi.Elements.text [] [ NativeUi.string (item_ ++ " left")]
            --  ]
            --, NativeUi.Elements.view
            --  [
            --    --id "filters"
            --  ]
            --  [ visibilitySwap "#/" "All" visibility
            --  , NativeUi.Elements.text [] [NativeUi.string " "]
            --  , visibilitySwap "#/active" "Active" visibility
            --  , NativeUi.Elements.text [] [NativeUi.string " "]
            --  , visibilitySwap "#/completed" "Completed" visibility
            --  ]
            --, NativeUi.Elements.text
            --  [
            --  --  class "clear-completed"
            --  --, id "clear-completed"
            --  --, hidden (tasksCompleted == 0)
            --  --, onClick (MsgForTaskList DeleteComplete)
            --  ]
            --  [ NativeUi.string ("Clear completed (" ++ toString tasksCompleted ++ ")") ]
            ]



--visibilitySwap : String -> String -> String -> Html Main.Msg
--visibilitySwap uri visibility actualVisibility =
--  li [ onClick (MsgForControl <| ChangeVisibility visibility) ]
--    [ a [ href uri, classList [ ( "selected", visibility == actualVisibility ) ] ] [ text visibility ] ]
--visibilitySwap : String -> String -> String -> NativeUi.Node Todo.Msg.Msg
--visibilitySwap uri visibility actualVisibility =
--  NativeUi.Elements.view
--    [
--      --onClick (MsgForControl <| ChangeVisibility visibility)
--    ]
--    [ NativeUi.Elements.view
--      [
--      --href uri
--      --, classList [ ( "selected", visibility == actualVisibility ) ]
--      ]
--      [ NativeUi.Elements.text [] [NativeUi.string visibility] ]
--    ]
