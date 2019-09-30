module Main exposing (..)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
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
    , organizers : String
    , patronats : String
    , longNote :
        { first : String
        , second : String
        , third : String
        , fourth : String
        , fifth : String
        }
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
        [ Grid.row [ Row.centerMd ]
            [ Grid.col [ Col.xs12 ]
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
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ class "organizers-wrapper" ] ]
            [ Grid.col
                [ Col.xs12, Col.attrs [ class "organizers" ] ]
                [ text lang.organizers ]
            , Grid.col [ Col.xs12, Col.attrs [ class "organizers-logos" ] ]
                [ img [ src "src/assets/public/logo_kliniki_dermy.png" ] []
                , img [ src "src/assets/public/logo_kola_ed.png" ] []
                , img [ src "src/assets/public/logo_dermatologiczne.png" ] []
                , img [ src "src/assets/public/logo_gumed.jpg" ] []
                , img [ src "src/assets/public/logo_kliniki_dermy.png" ] []
                ]
            , Grid.col
                [ Col.xs12, Col.attrs [ class "patronats" ] ]
                [ text lang.patronats ]
            , Grid.col [ Col.xs12, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_pathronage.png" ] []
                , img [ src "src/assets/public/logo_ptu_small.jpg" ] []
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ class "hashtag" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "hashtag-large" ] ]
                [ text "#shamlessgdansk" ]
            , Grid.col [ Col.xs12, Col.attrs [ class "hashtag-small" ] ]
                [ text lang.longNote.first ]
            , Grid.col [ Col.xs12, Col.attrs [ class "hashtag-small" ] ]
                [ text lang.longNote.second ]
            , Grid.col [ Col.xs12, Col.attrs [ class "hashtag-small" ] ]
                [ text lang.longNote.third ]
            , Grid.col [ Col.xs12, Col.attrs [ class "hashtag-small" ] ]
                [ text lang.longNote.fourth ]
            , Grid.col [ Col.xs12, Col.attrs [ class "hashtag-small hashtag-fifth" ] ]
                [ text lang.longNote.fifth ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ class "about" ] ]
            []
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
    , organizers = "Organizers:"
    , patronats = "Honorary Patronage:"
    , longNote =
        { first = "Let's meet to talk about sexually transmitted diseases."
        , second = "Stop being ashamed to ask questions!"
        , third = "Get education, share knowledge and take care of your health."
        , fourth = "Do it for yourself, do it for the people you care about."
        , fifth = "Prevent what can be prevented."
        }
    }


polishLang : Language
polishLang =
    { about = "O konferencji"
    , sponsors = "Sponsorzy"
    , registration = "Rejestracja"
    , contact = "Kontakt"
    , organizers = "Organizatorzy:"
    , patronats = "Patronaty Honorowe:"
    , longNote =
        { first = "Spotkajmy się, aby porozmawiać o chorobach przenoszonych drogą płciową"
        , second = "Przestańmy się wstydzić, zacznijmy zadawać pytania!"
        , third = "Uczmy się, dzielmy się wiedzą z innymi i dbajmy o nasze zdrowie."
        , fourth = "Zróbmy to dla siebie i naszych najbliższych."
        , fifth = "Zabezpieczaj się, by zapobiegać."
        }
    }
