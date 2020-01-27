module Dog exposing (main)

import Html exposing (Html, text)


type alias Dog =
    { name : String
    , age : Int
    }


bulldog : Dog
bulldog =
    { name = "Spock"
    , age = 3
    }


renderDog : Dog -> String
renderDog dog =
    dog.name ++ "," ++ String.fromInt dog.age


main : Html msg
main =
    text <| renderDog bulldog
