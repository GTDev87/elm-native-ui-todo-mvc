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

import Task.Model
import Todo.Msg

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
--import Todo.Msg exposing (..)
--import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView



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



view : List Task.Model.Model -> String -> NativeUi.Node Todo.Msg.Msg -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view tasks visibility todoEntryNode children =
  let
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
      if isIos then Control.View.NavigationIOS.view else Control.View.NavigationAndroid.view
  in
    NativeUi.Elements.view
      []
      [ if isIos then
          todoEntryNode
        else
          NativeUi.Elements.view [] []
      , Control.View.NavigationIOS.view
        []
        [ NativeUi.Elements.view
          [ 
          --  id "footer"
          --, hidden (List.isEmpty tasks)
          ]
          [ NativeUi.Elements.view
            []
            children
          , NativeUi.Elements.view 
            [
              --id "todo-count"
            ]
            [ NativeUi.Elements.text [] [ NativeUi.string (toString tasksLeft) ]
            , NativeUi.Elements.text [] [ NativeUi.string (item_ ++ " left")]
            ]
          , NativeUi.Elements.view 
            [
              --id "filters"
            ]
            [ visibilitySwap "#/" "All" visibility
            , NativeUi.Elements.text [] [NativeUi.string " "]
            , visibilitySwap "#/active" "Active" visibility
            , NativeUi.Elements.text [] [NativeUi.string " "]
            , visibilitySwap "#/completed" "Completed" visibility
            ]
          , NativeUi.Elements.text
            [
            --  class "clear-completed"
            --, id "clear-completed"
            --, hidden (tasksCompleted == 0)
            --, onClick (MsgForTaskList DeleteComplete)
            ]
            [ NativeUi.string ("Clear completed (" ++ toString tasksCompleted ++ ")") ]
          ]
        ]
      ]


--visibilitySwap : String -> String -> String -> Html Main.Msg
--visibilitySwap uri visibility actualVisibility =
--  li [ onClick (MsgForControl <| ChangeVisibility visibility) ]
--    [ a [ href uri, classList [ ( "selected", visibility == actualVisibility ) ] ] [ text visibility ] ]

visibilitySwap : String -> String -> String -> NativeUi.Node Todo.Msg.Msg
visibilitySwap uri visibility actualVisibility =
  NativeUi.Elements.view 
    [
      --onClick (MsgForControl <| ChangeVisibility visibility)
    ]
    [ NativeUi.Elements.view 
      [
      --href uri
      --, classList [ ( "selected", visibility == actualVisibility ) ]
      ]
      [ NativeUi.Elements.text [] [NativeUi.string visibility] ]
    ]
