module Footer exposing (footer)

import Element exposing (Element, centerY, column, el, fill, height, padding, px, rgb255, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font


footer : Element msg
footer =
    row
        [ width fill
        , padding 24
        , height (px 400)
        , centerY
        , Background.color (rgb255 0 0 0)
        , Font.color (rgb255 255 255 255)
        , Element.alignBottom
        ]
        [ column
            [ spacing 12 ]
            [ el [ Font.bold ] (text "Marin Brochoire")
            , el [ Font.size 14 ] (text "Coucou")
            , el [ Font.size 14 ] (text "Coucou")
            , el [ Font.size 14 ] (text "Coucou")
            ]
        ]
