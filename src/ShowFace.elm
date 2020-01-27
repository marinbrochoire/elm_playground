module ShowFace exposing (main)

import Browser
import Html exposing (Html, button, div, h1, text)
import Html.Events exposing (onClick)


type alias Model =
    { showFace : Bool
    , name : String
    }


model : Model
model =
    { showFace = False
    , name = "Marin"
    }


type Msg
    = ShowFace
    | HideFace
    | ChangeName


update : Msg -> Model -> Model
update msg model_ =
    case msg of
        ShowFace ->
            { model_ | showFace = True }

        HideFace ->
            { model_ | showFace = False }

        ChangeName ->
            { model_ | name = "Michel" }


view : Model -> Html Msg
view model_ =
    div []
        [ h1 [] [ text "Face generator" ]
        , button [ onClick ShowFace ] [ text "Face me" ]
        , button [ onClick HideFace ] [ text "Hide me" ]
        , if model_.showFace then
            text "♕"

          else
            text ""
        , button [ onClick ChangeName ] [ text "Change my name" ]
        , h1 [] [ text model_.name ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox
        { init = model
        , view = view
        , update = update
        }
