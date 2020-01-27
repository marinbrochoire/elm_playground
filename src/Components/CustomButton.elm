module Components.CustomButton exposing (customButton)

import Element exposing (Element, el, padding, rgb255, text)
import Element.Background as Background
import Element.Border as Border


type alias Color =
    String


type alias Label =
    String


customButton : Color -> Label -> Element msg
customButton color label =
    case color of
        "red" ->
            el [ padding 16, Background.color (rgb255 255 0 0) ] (text label)

        "blue" ->
            el [ padding 24, Border.rounded 8, Background.color (rgb255 0 0 255) ] (text label)

        _ ->
            el [ Background.color (rgb255 255 255 255) ] (text label)
