module TaskList.View exposing (..)

import NativeUi.Elements
import NativeUi
import TaskList.Model
import Control.Model
import Task.View
import Todo.Msg


type alias Props =
    { visibility : Control.Model.VisibilityType
    }


view : TaskList.Model.Model -> Props -> NativeUi.Node Todo.Msg.Msg
view tasks props =
    let
        isVisible todo =
            case props.visibility of
                Control.Model.Completed ->
                    todo.completed

                Control.Model.Active ->
                    not todo.completed

                Control.Model.All ->
                    True

        allCompleted =
            List.all .completed tasks

        cssVisibility =
            if List.isEmpty tasks then
                "hidden"
            else
                "visible"
    in
        --section
        --  [ id "main"
        --  , style [ ( "visibility", cssVisibility ) ]
        --  ]
        --  [ input
        --    [ id "toggle-all"
        --    , type' "checkbox"
        --    , name "toggle"
        --    , checked allCompleted
        --    , onClick (MsgForTaskList <| CheckAll (not allCompleted))
        --    ]
        --    []
        --  , label [ for "toggle-all" ]
        --    [ text "Mark all as complete" ]
        --  , ul [ id "todo-list" ]
        --    (List.map todoItem (List.filter isVisible tasks))
        --  ]
        NativeUi.Elements.view
            []
            [ NativeUi.Elements.scrollView
                []
                (List.map Task.View.view (List.filter isVisible tasks))
            ]
