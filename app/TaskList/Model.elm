module TaskList.Model exposing (..)

import Task.Model

type alias Model =
  List Task.Model.Model

model : Model
model =
  []