module Control.View.NavigationIOS exposing (..)

import Native.TabBarItemIOS
import NativeUi.Elements
import NativeUi.Style
import NativeUi.Events
import NativeUi
import Todo.Msg
import Control.Msg
import Json.Encode
import Control.View.Navigation
import Control.Model
import Image.Image


tabBarNode : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
tabBarNode =
    NativeUi.customNode "TabBarItemIOS" Native.TabBarItemIOS.view


{-| -}
icon : Int -> NativeUi.Property msg
icon val =
    NativeUi.property "icon" (Json.Encode.int val)


tabBarItem : Control.Model.Model -> Control.View.Navigation.TabType -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
tabBarItem model tabType children =
    let
        selected =
            model.visibility == tabType.visibility
    in
        tabBarNode
            [ NativeUi.property "selected" (Json.Encode.bool selected)
            , icon (Image.Image.imgSrc tabType.icon)
            , NativeUi.property "title" (Json.Encode.string tabType.title)
            , NativeUi.property "key" (Json.Encode.string tabType.title)
            , NativeUi.Events.onPress (Todo.Msg.MsgForControl <| Control.Msg.ChangeVisibility tabType.visibility)
            ]
            [ NativeUi.Elements.view
                [ NativeUi.style
                    [ NativeUi.Style.flex 1
                    ]
                ]
                children
            ]


view : Control.Model.Model -> Control.View.Navigation.Props -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view model props children =
    NativeUi.Elements.view
        [ NativeUi.style
            [ NativeUi.Style.flex 1 ]
        ]
        [ NativeUi.node
            "TabBarIOS"
            []
            (List.map (\tabType -> tabBarItem model tabType children) props.tabTypes)
        ]
