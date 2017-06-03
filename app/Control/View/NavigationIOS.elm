module Control.View.NavigationIOS exposing (..)

import Native.TabBarItemIOS
import NativeUi.Elements
import NativeUi.Style
import NativeUi
import Todo.Msg
import Json.Encode
import Control.View.Navigation
import Control.Model


tabBarNode : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
tabBarNode =
    NativeUi.customNode "TabBarItemIOS" Native.TabBarItemIOS.view


type alias TabType =
    { visibility : String
    , icon : String
    , title : String
    }


tabBarItem : Control.Model.Model -> Control.View.Navigation.TabType -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
tabBarItem model tabType children =
    let
        selected =
            model.visibility == tabType.visibility
    in
        tabBarNode
            [ NativeUi.property "selected" (Json.Encode.bool selected)
            , NativeUi.property "systemIcon" (Json.Encode.string "recents") -- tabType.icon
            , NativeUi.property "title" (Json.Encode.string tabType.title)
            , NativeUi.property "key" (Json.Encode.string tabType.visibility)
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
            (List.map (\tabType -> tabBarItem (Debug.log "model" model) tabType children) props.tabTypes)
        ]
