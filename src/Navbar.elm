module Navbar exposing (navigation)

import Element exposing (Element, alignRight, centerY, el, fill, link, padding, row, spacing, text, width)
import Element.Background as Background
import Element.Font as Font
import Theme as T


navigation : Element msg
navigation =
    row
        [ width fill
        , padding T.spacing.medium
        , centerY
        , Background.color T.colors.blue
        , Font.color T.colors.white
        , Font.bold
        , Element.alignTop
        ]
        [ el [ Font.size T.fontSizes.subtitle ]
            (text "Marin Brochoire")
        , row
            [ alignRight
            , spacing 30
            , Font.extraLight
            , Font.size 16
            ]
            [ link
                []
                { url = "/"
                , label = text "Home"
                }
            , link
                []
                { url = "/cat"
                , label = text "Chats"
                }
            , link
                []
                { url = "/about"
                , label = text "About"
                }
            ]
        ]
