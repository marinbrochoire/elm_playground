module Theme exposing (colors, fontSizes, spacing)

import Element exposing (Color, rgb255)



-- Colors


type alias Colors =
    { blue : Color
    , black : Color
    , white : Color
    }


colors : Colors
colors =
    { blue = rgb255 0 0 255
    , black = rgb255 0 0 0
    , white = rgb255 255 255 255
    }



-- Spacing


type alias Spacing =
    { small : Int
    , medium : Int
    , large : Int
    }


spacing : Spacing
spacing =
    { small = 12
    , medium = 24
    , large = 48
    }



-- Fonts


type alias FontSizes =
    { hero : Int
    , title : Int
    , subtitle : Int
    , body : Int
    , excerpt : Int
    }


fontSizes : FontSizes
fontSizes =
    { hero = 80
    , title = 44
    , subtitle = 24
    , body = 16
    , excerpt = 10
    }
