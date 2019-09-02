module Main exposing (..)

import Html exposing (Html, div, h1, p, source, strong, text, video)
import Html.Attributes exposing (attribute, autoplay, class, id, loop, src, type_)


view : Html msg
view =
    div [ class "video-wrapper" ]
        [ video
            [ class "full-video"
            , id "video"
            , attribute "muted" ""
            , attribute "preload" ""
            , autoplay True
            , loop True
            ]
            [ source
                [ src "src/assets/public/shameless_gdansk_logo_animation_v2.mp4"
                , type_ "video/mp4"
                ]
                []
            ]
        ]


main =
    view
