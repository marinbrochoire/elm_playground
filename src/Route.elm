module Route exposing (..)

import Url
import Url.Parser as Parser


type Route
    = Cat
    | About
    | Home


fromUrl : Url.Url -> Maybe Route
fromUrl url =
    Parser.parse parser url


parser : Parser.Parser (Route -> a) a
parser =
    Parser.oneOf
        [ Parser.map Home Parser.top
        , Parser.map About (Parser.s "about")
        , Parser.map Cat (Parser.s "cat")
        ]
