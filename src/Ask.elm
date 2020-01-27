module Ask exposing (main)

import Html exposing (Html, text)


politely : String -> String
politely phrase =
    "Excusme me," ++ phrase


ask : String -> String -> String
ask thing place =
    "is there a " ++ thing ++ " in the " ++ place ++ "?"


askPolitelyAboutTheFish : String -> String
askPolitelyAboutTheFish =
    politely << ask "fish"


main : Html msg
main =
    text <| askPolitelyAboutTheFish "pond"
