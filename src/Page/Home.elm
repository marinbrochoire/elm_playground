module Page.Home exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( Model, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ h1 []
            [ text "Home Page" ]
        , a [ href "/cat" ] [ text "cat" ]
        , a [ href "/about" ] [ text "about page" ]
        ]
