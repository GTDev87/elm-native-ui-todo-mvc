module Main exposing (..)

import NativeUi as Ui exposing (Node)
import NativeUi.Style as Style exposing (defaultTransform)
import NativeUi.Elements as Elements exposing (..)
import NativeUi.Events exposing (..)
import NativeUi.Image as Image exposing (..)

import Todo.View
import Todo.Model
import Todo.Msg
import TaskList.Update

import Todo.Update


-- MODEL


--type alias Model =
--  Int


--model : Model
--model =
--  90012


---- UPDATE


--type Msg
--  = Increment
--  | Decrement






---- VIEW


view : Todo.Model.Model -> Node Todo.Msg.Msg
view model =
  let
    imageSource =
      { uri = "https://raw.githubusercontent.com/futurice/spiceprogram/master/assets/img/logo/chilicorn_no_text-128.png"
      , cache = Just ForceCache
      }
  in
    Elements.view
      [ Ui.style [ Style.alignItems "center" ]
      ]
      [ image
        [ Ui.style
          [ Style.height 64
          , Style.width 64
          , Style.marginBottom 30
          , Style.marginTop 30
          ]
        , source imageSource
        ]
        []
      , text
        [ Ui.style
          [ Style.textAlign "center"
          , Style.marginBottom 30
          ]
        ]
        [ Ui.string ("Counter: " ++ toString 9001)
        ]
      , Elements.view
        [ Ui.style
          [ Style.width 80
          , Style.flexDirection "row"
          , Style.justifyContent "space-between"
          ]
        ]
        [ -- button Decrement "#d33" "-"
        --, button Increment "#3d3" "+"
        ]--

      , Todo.View.view model
      ]


--button : Msg -> String -> String -> Node Msg
--button msg color content =
--  text
--      [ Ui.style
--        [ Style.color "white"
--        , Style.textAlign "center"
--        , Style.backgroundColor color
--        , Style.paddingTop 5
--        , Style.paddingBottom 5
--        , Style.width 30
--        , Style.fontWeight "bold"
--        , Style.shadowColor "#000"
--        , Style.shadowOpacity 0.25
--        , Style.shadowOffset 1 1
--        , Style.shadowRadius 5
--        , Style.transform { defaultTransform | rotate = Just "10deg" }
--        ]
--      , onPress msg
--      ]
--      [ Ui.string content ]



-- PROGRAM


main : Program Never Todo.Model.Model Todo.Msg.Msg
main =
  Ui.program
    { init = Todo.Model.init
    , view = view
    , update = Todo.Update.update
    , subscriptions = \_ -> Sub.none
    }
