module Todo.Model exposing (..)

import Task.Model as Task
import TaskList.Model as TaskList
import Control.Model as Control
import Todo.Msg exposing (Msg)


type alias Model =
  { taskEntry : Task.Model
  , taskList : TaskList.Model
  , control : Control.Model
  }


initialModel : Model
initialModel =
  { taskEntry = Task.model
  , taskList = TaskList.model
  , control = Control.model
  }


init : ( Model, Cmd Msg )
init =
  initialModel ! []