module Control.Model exposing (..)

type VisibilityType
    = All
    | Active
    | Completed

type alias Model =
    { visibility : VisibilityType
    }


model : Model
model =
    { visibility = All
    }
