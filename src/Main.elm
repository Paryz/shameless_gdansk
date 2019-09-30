module Main exposing (..)

import Bootstrap.Grid as Grid
import Browser
import Html exposing (Html, a, div, h1, img, nav, p, source, strong, text, video)
import Html.Attributes exposing (autoplay, class, href, id, loop, property, src, type_)
import Html.Events exposing (onClick)
import Json.Encode as Json


type alias Language =
    { about : String
    , sponsors : String
    , registration : String
    , contact : String
    }


type alias Model =
    { languageJson : Language }


type Msg
    = ToEng
    | ToPln


view : Model -> Html Msg
view model =
    let
        lang =
            model.languageJson
    in
    Grid.containerFluid [ class "video-wrapper" ]
        [ nav [ class "navigation" ]
            [ div []
                [ a [ href "#", onClick ToPln ] [ text "PL" ]
                , text " / "
                , a [ href "#", onClick ToEng ] [ text "EN" ]
                ]
            , a [ href "#about" ] [ text lang.about ]
            , a [ href "#sponsors" ] [ text lang.sponsors ]
            , a [ href "#registration" ] [ text lang.registration ]
            , a [ href "#contact" ] [ text lang.contact ]
            ]
        , video
            [ class "full-video"
            , id "video"
            , property "muted" (Json.bool True)
            , property "playsinline" (Json.bool True)
            , autoplay True
            , loop True
            ]
            [ source
                [ src "src/assets/public/shameless_gdansk_logo_animation_v1.mp4"
                , type_ "video/mp4"
                ]
                []
            ]
        , div [ id "about" ] []
        , div [ id "sponsors" ] []
        , div [ id "registration" ] []
        , div [ id "contact" ] []
        ]


main =
    Browser.sandbox { init = { languageJson = polishLang }, update = update, view = view }


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToEng ->
            { model | languageJson = englishLang }

        ToPln ->
            { model | languageJson = polishLang }


englishLang : Language
englishLang =
    { about = "About conference"
    , sponsors = "Sponsors"
    , registration = "Registration"
    , contact = "Contact"
    }


polishLang : Language
polishLang =
    { about = "O konferencji"
    , sponsors = "Sponsorzy"
    , registration = "Rejestracja"
    , contact = "Kontakt"
    }
