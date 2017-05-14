module Image.Image exposing (..)

import Native.Image
import Json.Encode
import NativeUi

imgSrc : String -> Int
imgSrc name =
  Native.Image.loadImage name

{-| -}
localSource : Int -> NativeUi.Property msg
localSource val =
  NativeUi.property "source" (Json.Encode.int val)
