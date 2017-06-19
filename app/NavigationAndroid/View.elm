module NavigationAndroid.View exposing (..)

import NativeUi.Elements
import NativeUi.Events
import NativeUi.Properties
import NativeUi
import NativeUi.Style
import Todo.Msg
import Control.Types
import Control.Model
import Control.Msg
import Json.Encode
import Image.Image
import Native.LayoutToolbarAndroid


navigationTab : Control.Types.TabType -> NativeUi.Node Todo.Msg.Msg
navigationTab tabType =
    closingTouchableHighlightView
        [ NativeUi.Properties.underlayColor "#ccc"
        , NativeUi.Events.onPress (Todo.Msg.MsgForControl <| Control.Msg.ChangeVisibility tabType.visibility) -- also needs to send a close message...
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


renderNavigation : Control.Model.Model -> Control.Types.Props -> a -> NativeUi.Node Todo.Msg.Msg
renderNavigation model props _ =
    NativeUi.Elements.view
        [ NativeUi.style
            -- container
            [ NativeUi.Style.flex 1 ]
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
            ++ List.map (\tabType -> navigationTab tabType) props.tabTypes
        )


navIcon : Int -> NativeUi.Property msg
navIcon val =
    NativeUi.property "navIcon" (Json.Encode.int val)


closingTouchableHighlightView : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
closingTouchableHighlightView =
    NativeUi.customNode "ClosingTouchableHighlight" Native.LayoutToolbarAndroid.closingTouchableHighlightView


drawerLayoutAndroidView : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
drawerLayoutAndroidView =
    NativeUi.customNode "DrawerLayoutAndroid2" Native.LayoutToolbarAndroid.drawerLayoutAndroidView


toolbarAndroidView : List (NativeUi.Property msg) -> List (NativeUi.Node msg) -> NativeUi.Node msg
toolbarAndroidView =
    NativeUi.customNode "ToolbarAndroid2" Native.LayoutToolbarAndroid.toolbarAndroidView


view : Control.Model.Model -> Control.Types.Props -> List (NativeUi.Node Todo.Msg.Msg) -> NativeUi.Node Todo.Msg.Msg
view model props children =
    let
        title =
            props.tabTypes
                |> (List.filter (\a -> a.visibility == model.visibility))
                |> List.head
                |> (Maybe.map (\a -> a.title))
                |> (Maybe.withDefault "All")
    in
        drawerLayoutAndroidView
            [ NativeUi.property "drawerWidth" (Json.Encode.float 300)
            , NativeUi.renderProperty "renderNavigationView" (renderNavigation model props)
            ]
            [ NativeUi.Elements.view
                [ NativeUi.style
                    -- container
                    [ NativeUi.Style.flex 1 ]
                ]
                [ toolbarAndroidView
                    [ NativeUi.style
                        [ NativeUi.Style.height 56 ]
                    , NativeUi.property "title" (Json.Encode.string title)
                    , navIcon (Image.Image.imgSrc "hamburger")
                    ]
                    []
                , props.todoEntryNode
                , NativeUi.Elements.view
                    [ NativeUi.style
                        -- container
                        [ NativeUi.Style.flex 1 ]
                    ]
                    children
                ]
            ]
