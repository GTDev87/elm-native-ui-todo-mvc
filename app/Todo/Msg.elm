module Todo.Msg exposing (..)

import TaskList.Msg
import Task.Msg
import Control.Msg


type Msg
    = NoOp
    | MsgForTaskEntry Task.Msg.Msg
    | MsgForTaskList TaskList.Msg.Msg
    | MsgForTask Int Task.Msg.Msg
    | MsgForControl Control.Msg.Msg
