module Page exposing (..)

import Page.About as About
import Page.Cat as Cat
import Page.Home as Home
import Page.NotFound as NotFound


type Page
    = Cat Cat.Model
    | About About.Model
    | Home Home.Model
    | NotFound NotFound.Model
