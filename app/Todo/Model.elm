module Todo.Model exposing (..)

import Task.Model
import TaskList.Model
import Control.Model
import Todo.Msg


type alias Model =
    { taskEntry : Task.Model.Model
    , taskList : TaskList.Model.Model
    , control : Control.Model.Model
    }


initialModel : Model
initialModel =
    { taskEntry = Task.Model.model
    , taskList = TaskList.Model.model
    , control = Control.Model.model
    }


init : ( Model, Cmd Todo.Msg.Msg )
init =
    initialModel ! []
