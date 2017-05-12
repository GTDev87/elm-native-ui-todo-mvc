module Task.View exposing (..)

import NativeUi.Elements as Elements exposing (..)
import NativeUi
import NativeUi.Events
import NativeUi.Style as Style
import SwipeoutView.SwipeoutView
--import TaskList.Model as TaskList

--import Html exposing (..)
--import Html.Attributes exposing (..)
--import Html.Lazy exposing (lazy, lazy2)
import Todo.Msg
import Task.Msg
import TaskList.Msg
--import Todo.Model exposing (Model)

--import TaskEntry.View as TaskEntryView
--import Control.View as ControlView
import Task.Model
--import InfoFooter.View exposing (infoFooter)



view : Task.Model.Model -> NativeUi.Node Todo.Msg.Msg
view todo =
  --li [ classList [ ( "completed", todo.completed ), ( "editing", todo.editing ) ] ]
  --  [ div [ class "view" ]
  --    [ input
  --      [ class "toggle"
  --      , type' "checkbox"
  --      , checked todo.completed
  --      , onClick (MsgForTask todo.id <| Check (not todo.completed))
  --      ]
  --      []
  --    , label [ onDoubleClick (MsgForTask todo.id <| Editing True) ]
  --      [ text todo.description ]
  --    , button
  --      [ class "destroy"
  --      , onClick (MsgForTaskList <| Delete todo.id)
  --      ]
  --      []
  --    ]
  --  , input
  --    [ class "edit"
  --    , value todo.description
  --    , name "title"
  --    , id ("todo-" ++ toString todo.id)
  --    , on "input" (Json.map (MsgForTask todo.id << Update) targetValue)
  --    , onBlur (MsgForTask todo.id <| Editing False)
  --    , onEnter NoOp (MsgForTask todo.id <| Editing False)
  --    ]
  --    []
  --  ]

  let
    viewDisabledStyles = if todo.completed then [ Style.opacity 0.5 ] else []
    labelCompletedStyling = if todo.completed then [ Style.textDecorationLine "line-through" ] else []
    --swipeoutBtns = [{
    --  text: 'Delete',
    --  backgroundColor: 'red',
    --  onPress: () => {
    --    const { todo } = this.props;
    --    this.props.onDelete({ todo });
    --  },
    --}];

  in
    SwipeoutView.SwipeoutView.view
      [
        SwipeoutView.SwipeoutView.right
          [ SwipeoutView.SwipeoutView.stringProp "text" "delete"
          ]
      , SwipeoutView.SwipeoutView.onRightSwipe (Todo.Msg.MsgForTaskList <| TaskList.Msg.Delete todo.id)



          --, Maybe.map (stringDeclaration "rotate") options.rotate
      ]
      [ Elements.touchableHighlight
        [ NativeUi.Events.onPress (Todo.Msg.MsgForTask todo.id <| Task.Msg.Check (not todo.completed))
        , NativeUi.Events.onLongPress (Todo.Msg.MsgForTaskList <| TaskList.Msg.Delete todo.id)
        ]
        [ Elements.view
          [ NativeUi.style
            [ Style.borderBottomWidth 1
            , Style.borderBottomColor "#ededed"
            , Style.flexDirection "row"
            , Style.paddingTop 15
            , Style.paddingRight 60
            ]
          ]
          [
            Elements.view
            [ NativeUi.style
              [ Style.flex 1
              , Style.flexDirection "column"
              , Style.alignItems "flex-start"
              ]
            ]
            [ Elements.text
              [ NativeUi.style
                (
                  [ Style.fontSize 24
                  , Style.paddingBottom 15
                  , Style.paddingTop 1
                  , Style.marginLeft 10
                  ] ++ viewDisabledStyles ++ labelCompletedStyling
                )
              ]
              [ NativeUi.string todo.description ]
            , Elements.text
              []
              []
            , Elements.textInput
              []
              []
            ]
          ]
        ]
      ]
