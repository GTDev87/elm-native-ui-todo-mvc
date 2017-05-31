module Control.View.NavigationIOS exposing (..)

import Native.TabBarItemIOS
import NativeUi.Elements
import NativeUi.Style
import NativeUi
import Todo.Msg
import Json.Encode


tabBarItem : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
tabBarItem =
    NativeUi.customNode "TabBarItemIOS" Native.TabBarItemIOS.view


view : List (NativeUi.Property msg) -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view properties children =
    NativeUi.Elements.view
        [ NativeUi.style
            [ NativeUi.Style.flex 1 ]
        ]
        [ NativeUi.node
            "TabBarIOS"
            []
            [ tabBarItem
                [ NativeUi.property "selected" (Json.Encode.bool True)
                , NativeUi.property "systemIcon" (Json.Encode.string "recents")
                , NativeUi.property "title" (Json.Encode.string "main")
                , NativeUi.property "key" (Json.Encode.string "mainkey")
                ]
                [ NativeUi.Elements.view
                    [ NativeUi.style
                        [ NativeUi.Style.flex 1
                        ]
                    ]
                    children
                ]
            , tabBarItem
                [ NativeUi.property "selected" (Json.Encode.bool False)
                , NativeUi.property "systemIcon" (Json.Encode.string "contacts")
                , NativeUi.property "title" (Json.Encode.string "main2")
                , NativeUi.property "key" (Json.Encode.string "mainkey2")
                ]
                [ NativeUi.Elements.view
                    [ NativeUi.style
                        [ NativeUi.Style.flex 1 ]
                    ]
                    children
                ]
            ]
        ]
