module SwipeoutView.SwipeoutView exposing (..)

import NativeUi
import NativeUi.Style
import Native.ReactNativeSwipeoutView
import Json.Encode
import Json.Decode
import Todo.Msg

type Value
  = StringValue String
  | NumberValue Float
  | BoolValue Bool
  | ObjectValue (List Declaration)
  | ListValue (List (Maybe Declaration))

type alias Declaration =
  ( String, Value )

encodeValue : Value -> Json.Encode.Value
encodeValue value =
  case value of
    NumberValue float ->
      Json.Encode.float float

    StringValue string ->
      Json.Encode.string string

    BoolValue bool ->
      Json.Encode.bool bool

    ObjectValue list ->
      Json.Encode.object (List.map encodeDeclaration list)

    ListValue list ->
      Json.Encode.list (List.map encodeObject (List.filterMap identity list))

encodeObject : ( String, Value ) -> Json.Encode.Value
encodeObject ( name, value ) =
    Json.Encode.object [ ( name, (encodeValue value) ) ]

encodeDeclaration : ( String, Value ) -> ( String, Json.Encode.Value )
encodeDeclaration ( name, value ) =
    ( name, encodeValue value )

type alias ButtonOption =
  { backgroundColor : Maybe String
  , color : Maybe String
  --, component : Maybe NativeUi.Node
  --, onPress :  Maybe Todo.Msg.Msg
  , text : Maybe String
  , buttonType : Maybe String
  , underlayColor : Maybe String
  , disabled : Maybe Bool
  }


{-| -}
defaultButton : ButtonOption
defaultButton =
  { backgroundColor = Nothing
  , color = Nothing
  --, component = Nothing
  --, onPress = Nothing
  , text = Nothing
  , buttonType = Nothing
  , underlayColor = Nothing
  , disabled = Nothing
  }

stringDeclaration : String -> String -> Declaration
stringDeclaration name value =
  ( name, StringValue value )


boolDeclaration : String -> Bool -> Declaration
boolDeclaration name value =
  ( name, BoolValue value )


listDeclaration : String -> List (Maybe Declaration) -> Declaration
listDeclaration name value =
  ( name, ListValue value )

{-| -}
buttonOptions : ButtonOption -> List (Maybe Declaration)
buttonOptions buttonOption =
  [ Maybe.map (stringDeclaration "backgroundColor") buttonOption.backgroundColor
  , Maybe.map (stringDeclaration "color") buttonOption.color
  --, Maybe.map (stringDeclaration "component") buttonOption.component -- node
  --, Maybe.map (msgDeclaration "onPress") buttonOption.onPress -- property
  , Maybe.map (stringDeclaration "text") buttonOption.text
  , Maybe.map (stringDeclaration "type") buttonOption.buttonType
  , Maybe.map (stringDeclaration "underlayColor") buttonOption.underlayColor
  , Maybe.map (boolDeclaration "disabled") buttonOption.disabled
  ]

view : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
view =
  NativeUi.customNode "ReactNativeSwipeoutView" Native.ReactNativeSwipeoutView.view

encode : ( String, Value ) -> Json.Encode.Value
encode ( name, value ) =
    Json.Encode.object [ ( name, (encodeValue value) ) ]

stringProp : String -> String -> ( String, Value )
stringProp name value =
  (name, StringValue value)

onRightSwipe : msg -> NativeUi.Property msg
onRightSwipe msg =
  NativeUi.on "onRightSwipe" (Json.Decode.succeed msg) 

backgroundColor : String -> NativeUi.Property msg
backgroundColor val =
  NativeUi.property "backgroundColor" (Json.Encode.string val)

right : List Declaration -> NativeUi.Property msg
right list =
  NativeUi.property
    "right"
     (list |> ObjectValue |> encodeValue )
