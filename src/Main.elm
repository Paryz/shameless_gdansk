module Main exposing (..)

import Html exposing (Html, div, h1, p, source, strong, text, video)
import Html.Attributes exposing (autoplay, class, id, loop, property, src, type_)
import Json.Encode as Json


view : Html msg
view =
    div [ class "video-wrapper" ]
        [ video
            [ class "full-video"
            , id "video"
            , property "muted" (Json.bool True)
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
