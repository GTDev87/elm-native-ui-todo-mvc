module Control.View.NavigationAndroid exposing (..)

import NativeUi.Elements
import NativeUi.Events
import NativeUi.Properties
import NativeUi
import NativeUi.Style
import Todo.Msg
import Control.View.Navigation
import Control.Model
import Control.Msg
import Json.Encode
import Image.Image
import Native.LayoutToolbarAndroid


navigationTab : Control.Model.Model -> Control.View.Navigation.TabType -> NativeUi.Node Todo.Msg.Msg
navigationTab model tabType =
    NativeUi.Elements.touchableHighlight
        [ NativeUi.Properties.underlayColor "#ccc"
        , NativeUi.Events.onPress (Todo.Msg.MsgForControl <| Control.Msg.ChangeVisibility tabType.visibility)
        , NativeUi.property "key" (Json.Encode.string tabType.title)
        ]
        [ NativeUi.Elements.view
            [ NativeUi.style
                [ NativeUi.Style.borderBottomWidth 1 -- navigationMenuItem
                , NativeUi.Style.borderBottomColor "#ededed"
                , NativeUi.Style.flexDirection "row"
                , NativeUi.Style.paddingTop 15
                , NativeUi.Style.paddingBottom 15
                , NativeUi.Style.paddingLeft 15
                ]
            ]
            [ NativeUi.Elements.image
                [ NativeUi.style
                    [ NativeUi.Style.marginTop 5 ]
                , Image.Image.localSource (Image.Image.imgSrc tabType.icon)
                ]
                []
            , NativeUi.Elements.text
                [ NativeUi.style
                    [ NativeUi.Style.fontSize 24 -- label
                    , NativeUi.Style.marginLeft 10
                    ]
                ]
                [ NativeUi.string tabType.title ]
            ]
        ]


renderNavigation : Control.Model.Model -> Control.View.Navigation.Props -> a -> NativeUi.Node Todo.Msg.Msg
renderNavigation model props _ =
    NativeUi.Elements.view
        [ NativeUi.style
            [ NativeUi.Style.flex 1 ]

        -- container
        ]
        ([ NativeUi.Elements.text
            [ NativeUi.style
                [ NativeUi.Style.fontSize 50 -- header
                , NativeUi.Style.textAlign "center"
                , NativeUi.Style.color "rgba(175, 47, 47, 0.15)"
                , NativeUi.Style.marginTop 50
                , NativeUi.Style.marginBottom 100
                ]
            ]
            [ NativeUi.string "todos" ]
         ]
            ++ List.map (\tabType -> navigationTab model tabType) props.tabTypes
        )


navIcon : Int -> NativeUi.Property msg
navIcon val =
    NativeUi.property "navIcon" (Json.Encode.int val)


view : Control.Model.Model -> Control.View.Navigation.Props -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view model props children =
    NativeUi.customNode
        "DrawerLayoutAndroid"
        Native.LayoutToolbarAndroid.drawerLayoutAndroidView
        [ NativeUi.property "drawerWidth" (Json.Encode.float 300)
        , NativeUi.renderProperty "renderNavigationView" (renderNavigation model props)
        ]
        [ NativeUi.Elements.view
            [ NativeUi.style
                [ NativeUi.Style.flex 1 ]

            -- container
            ]
            [ NativeUi.customNode
                "ToolbarAndroid"
                Native.LayoutToolbarAndroid.toolbarAndroidView
                [ NativeUi.style
                    [ NativeUi.Style.height 56 ]
                , navIcon (Image.Image.imgSrc "hamburger")
                , NativeUi.property "title" (Json.Encode.string "title") -- not actually title
                ]
                []
            , props.todoEntryNode
            , NativeUi.Elements.view
                [ NativeUi.style
                    [ NativeUi.Style.flex 1 ]

                -- container
                ]
                children
            ]
        ]
