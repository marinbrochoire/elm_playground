module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Page as Page
import Page.About as About
import Page.Cat as Cat
import Page.Home as Home
import Page.NotFound as NotFound
import Route
import Url



-- MODEL


type alias Model =
    { key : Nav.Key
    , page : Page.Page
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        maybeRoute =
            Route.fromUrl url

        ( pageModel, _ ) =
            NotFound.init

        model =
            Model key (Page.NotFound pageModel)
    in
    routePage maybeRoute model



-- UPDATE


type Msg
    = CatMsg Cat.Msg
    | AboutMsg About.Msg
    | HomeMsg Home.Msg
    | NotFoundMsg NotFound.Msg
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            routePage (Route.fromUrl url) model

        _ ->
            ( model, Cmd.none )


routePage : Maybe Route.Route -> Model -> ( Model, Cmd Msg )
routePage maybeRoute model =
    case maybeRoute of
        Just Route.Cat ->
            routeCat model Cat.init

        Just Route.About ->
            routeAbout model About.init

        Just Route.Home ->
            routeHome model Home.init

        Nothing ->
            routeNotFound model NotFound.init


routeCat : Model -> ( Cat.Model, Cmd Cat.Msg ) -> ( Model, Cmd Msg )
routeCat model ( pageModel, cmds ) =
    ( { model | page = Page.Cat pageModel }, Cmd.none )


routeAbout : Model -> ( About.Model, Cmd About.Msg ) -> ( Model, Cmd Msg )
routeAbout model ( pageModel, cmds ) =
    ( { model | page = Page.About pageModel }, Cmd.none )


routeHome : Model -> ( Home.Model, Cmd Home.Msg ) -> ( Model, Cmd Msg )
routeHome model ( pageModel, cmds ) =
    ( { model | page = Page.Home pageModel }, Cmd.none )


routeNotFound : Model -> ( NotFound.Model, Cmd NotFound.Msg ) -> ( Model, Cmd Msg )
routeNotFound model ( pageModel, cmds ) =
    ( { model | page = Page.NotFound pageModel }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        { page } =
            model
    in
    { title = "Elm Example"
    , body =
        [ case page of
            Page.Cat pageModel ->
                Cat.view pageModel
                    |> Html.map CatMsg

            Page.About pageModel ->
                About.view pageModel
                    |> Html.map AboutMsg

            Page.Home pageModel ->
                Home.view pageModel
                    |> Html.map HomeMsg

            Page.NotFound pageModel ->
                NotFound.view pageModel
                    |> Html.map NotFoundMsg
        ]
    }



-- PROGRAM


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
