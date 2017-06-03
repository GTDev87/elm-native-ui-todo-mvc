module Control.View.Navigation exposing (..)


type alias TabType =
    { visibility : String
    , icon : String
    , title : String
    }


type alias Props =
    { tabTypes : List TabType
    }


tabTypes : List TabType
tabTypes =
    [ { visibility = "all"
      , icon = "all"
      , title = "All"
      }
    , { visibility = "active"
      , icon = "active"
      , title = "Active"
      }
    , { visibility = "completed"
      , icon = "completed"
      , title = "Completed"
      }
    ]
