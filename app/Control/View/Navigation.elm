module Control.View.Navigation exposing (..)

import Control.Model
import NativeUi
import Todo.Msg


type alias TabType =
    { visibility : Control.Model.VisibilityType
    , icon : String
    , title : String
    }


type alias Props =
    { tabTypes : List TabType
    , todoEntryNode : NativeUi.Node Todo.Msg.Msg
    }


tabTypes : List TabType
tabTypes =
    [ { visibility = Control.Model.All
      , icon = "all"
      , title = "All"
      }
    , { visibility = Control.Model.Active
      , icon = "active"
      , title = "Active"
      }
    , { visibility = Control.Model.Completed
      , icon = "completed"
      , title = "Completed"
      }
    ]
