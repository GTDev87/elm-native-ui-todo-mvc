module Task.Images.ImageLoad exposing (..)

import Native.ImageLoad

imgSrc : String -> Int
imgSrc list =
  Native.ImageLoad.loadImage "checked"
