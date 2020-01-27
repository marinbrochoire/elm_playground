module Main exposing (main)

-- import Browser.Events exposing (onClick)

import Browser
import Element exposing (centerX, centerY, column, el, fill, height, image, shrink, spacing, text, width)
import Element.Font as Font
import Element.Input exposing (button)
import Footer exposing (footer)
import Html exposing (Html)
import Http
import Json.Decode exposing (Decoder, field, map2, string)
import Navbar exposing (navigation)



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


type Model
    = Failure
    | Loading
    | Success Cat



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( Loading
    , getRandomCatGif
    )


type alias Cat =
    { image_url : String
    , title : String
    }



-- UPDATE


type Msg
    = MorePlease
    | GotGif (Result Http.Error Cat)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        MorePlease ->
            ( Loading, getRandomCatGif )

        GotGif result ->
            case result of
                Ok url ->
                    ( Success url, Cmd.none )

                Err _ ->
                    ( Failure, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    Element.layout [ width fill, height fill ]
        (column
            [ width fill, height fill, spacing 24 ]
            [ Navbar.navigation
            , case model of
                Failure ->
                    el [ centerX, centerY ]
                        (text "Impossible de charger le chat.")

                Loading ->
                    el [ centerX, centerY ] (text "Chargement ..")

                Success cat ->
                    el [ width fill, height fill ]
                        (column [ width fill, height fill ]
                            [ image
                                [ height shrink, width shrink, centerX, centerY ]
                                { description = cat.title, src = cat.image_url }
                            , el [ centerX ] (text cat.title)
                            ]
                        )
            , case model of
                Failure ->
                    button
                        [ Font.size 30
                        , centerX
                        ]
                        { label =
                            el []
                                (text "😾")
                        , onPress = Just MorePlease
                        }

                Loading ->
                    button
                        [ Font.size 30
                        , centerX
                        ]
                        { label =
                            el []
                                (text "🙀")
                        , onPress = Just MorePlease
                        }

                Success cat ->
                    button
                        [ Font.size 30
                        , centerX
                        ]
                        { label =
                            el []
                                (text "😸")
                        , onPress = Just MorePlease
                        }
            , Footer.footer
            ]
        )



-- HTTP


getRandomCatGif : Cmd Msg
getRandomCatGif =
    Http.get
        { url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=cat"
        , expect = Http.expectJson GotGif gifDecoder
        }


gifDecoder : Decoder Cat
gifDecoder =
    field "data"
        (map2 Cat
            (field "image_url" string)
            (field "title" string)
        )
