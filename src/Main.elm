module Main exposing (..)

import Html exposing (Html, div, h1, p, strong, text)
import Html.Attributes exposing (class)


view : Html msg
view =
    div [ class "jumbotron" ]
        [ h1 [] [ text "Welcome to Shameless Gdańsk" ]
        , p [] [ text "Work in progress" ]
        , p [] [ strong [] [ text "Keep in touch" ] ]
        ]


main =
    view
