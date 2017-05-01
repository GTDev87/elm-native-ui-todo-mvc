module Control.View exposing (..)

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Events exposing (..)
--import Msg.Main as Main exposing (..)
--import Msg.TaskList exposing (..)
--import Msg.Control exposing (..)
--import Model.Task as Task


import NativeUi.Elements as Elements exposing (..)
import NativeUi as Ui exposing (Node)

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

view : String -> List Task.Model.Model -> Node Todo.Msg.Msg
view visibility tasks =
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
  in
    Elements.view
      [ 
      --  id "footer"
      --, hidden (List.isEmpty tasks)
      ]
      [ Elements.view 
        [
          --id "todo-count"
        ]
        [ Elements.text [] [ Ui.string (toString tasksLeft) ]
        , Elements.text [] [ Ui.string (item_ ++ " left")]
        ]
      , Elements.view 
        [
          --id "filters"
        ]
        [ visibilitySwap "#/" "All" visibility
        , Elements.text [] [Ui.string " "]
        , visibilitySwap "#/active" "Active" visibility
        , Elements.text [] [Ui.string " "]
        , visibilitySwap "#/completed" "Completed" visibility
        ]
      , Elements.text
        [
        --  class "clear-completed"
        --, id "clear-completed"
        --, hidden (tasksCompleted == 0)
        --, onClick (MsgForTaskList DeleteComplete)
        ]
        [ Ui.string ("Clear completed (" ++ toString tasksCompleted ++ ")") ]
      ]


--visibilitySwap : String -> String -> String -> Html Main.Msg
--visibilitySwap uri visibility actualVisibility =
--  li [ onClick (MsgForControl <| ChangeVisibility visibility) ]
--    [ a [ href uri, classList [ ( "selected", visibility == actualVisibility ) ] ] [ text visibility ] ]

visibilitySwap : String -> String -> String -> Node Todo.Msg.Msg
visibilitySwap uri visibility actualVisibility =
  Elements.view 
    [
      --onClick (MsgForControl <| ChangeVisibility visibility)
    ]
    [ Elements.view 
      [
      --href uri
      --, classList [ ( "selected", visibility == actualVisibility ) ]
      ]
      [ Elements.text [] [Ui.string visibility] ]
    ]