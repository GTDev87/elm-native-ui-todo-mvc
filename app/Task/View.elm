module Task.View exposing (..)

import NativeUi
import NativeUi.Elements
import NativeUi.Properties
import NativeUi.Events
import NativeUi.Style
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
import Image.Image
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
    viewDisabledStyles = if todo.completed then [ NativeUi.Style.opacity 0.5 ] else []
    labelCompletedStyling = if todo.completed then [ NativeUi.Style.textDecorationLine "line-through" ] else []
    checkBox = Image.Image.imgSrc (if todo.completed then "checked" else "unchecked")
  in
    SwipeoutView.SwipeoutView.view
      [ SwipeoutView.SwipeoutView.backgroundColor "transparent"
      , SwipeoutView.SwipeoutView.right
          [ SwipeoutView.SwipeoutView.stringProp "text" "delete"
          , SwipeoutView.SwipeoutView.stringProp "backgroundColor" "red"
          ]
      , SwipeoutView.SwipeoutView.onRightSwipe (Todo.Msg.MsgForTaskList <| TaskList.Msg.Delete todo.id)



          --, Maybe.map (stringDeclaration "rotate") options.rotate
      ]
      [ NativeUi.Elements.touchableOpacity
        [ NativeUi.Events.onPress (Todo.Msg.MsgForTask todo.id <| Task.Msg.Check (not todo.completed))
        , NativeUi.Properties.underlayColor "transparent"
        ]
        [ NativeUi.Elements.view
          [ NativeUi.style -- item
            ( [ NativeUi.Style.borderBottomWidth 1
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
              [ NativeUi.Style.marginLeft 10
              , NativeUi.Style.marginTop 3
              , NativeUi.Style.height 32 -- remove when ready
              , NativeUi.Style.width 32 -- remove when ready
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
            [ NativeUi.Elements.text
              [ NativeUi.style
                ( [ NativeUi.Style.fontSize 24
                  , NativeUi.Style.paddingBottom 15
                  , NativeUi.Style.paddingTop 1
                  , NativeUi.Style.marginLeft 10
                  ]
                  ++ labelCompletedStyling
                )
              ] 
              [ NativeUi.string todo.description ]
            , NativeUi.Elements.text
              []
              []
            , NativeUi.Elements.textInput
              []
              []
            ]
          ]
        ]
      ]
