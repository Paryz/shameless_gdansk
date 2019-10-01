module Main exposing (..)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser
import Html exposing (Html, a, div, h1, img, nav, p, source, strong, text, video)
import Html.Attributes exposing (autoplay, class, download, href, id, loop, property, src, target, type_)
import Html.Events exposing (onClick)
import Json.Encode as Json


type LangType
    = EN
    | PL


type alias Language =
    { language : LangType
    , about : String
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
    , programme : String
    , aboutRecord :
        { first : String
        , second : String
        , third : String
        , fourth : String
        , fifth : String
        , sixth : String
        }
    , registrationNote : String
    , regulations : String
    , read : String
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
                , img [ src "src/assets/public/logo_gumed.png" ] []
                , img [ src "src/assets/public/logo_skn_uro.jpg" ] []
                ]
            , Grid.col [ Col.xs12, Col.attrs [ class "organizers-logos-smaller" ] ]
                [ img [ src "src/assets/public/logo_ebu.png" ] []
                , img [ src "src/assets/public/logo_kliniki_uro.png" ] []
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
                [ text "#shamelessgdansk" ]
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
        , Grid.row [ Row.centerMd, Row.attrs [ id "about" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "about-title" ] ]
                [ text <| String.toUpper lang.about ]
            , Grid.col [ Col.xs12, Col.attrs [ class "about-programme" ] ]
                [ a [ href programmeUrl, target "_blank", class "btn btn-dark" ] [ text <| String.toUpper lang.programme ] ]
            , Grid.col [ Col.xs12, Col.attrs [ class "about-table-row" ] ]
                [ div [ class "about-table-cell" ] [ text lang.aboutRecord.first ]
                , div [ class "pink about-table-cell" ] [ text lang.aboutRecord.second ]
                , div [ class "about-table-cell" ] [ text lang.aboutRecord.third ]
                ]
            , Grid.col [ Col.xs12, Col.attrs [ class "about-table-row" ] ]
                [ div [ class "pink about-table-cell" ] [ text lang.aboutRecord.fourth ]
                , div [ class "about-table-cell" ] [ text lang.aboutRecord.fifth ]
                , div [ class "pink about-table-cell" ] [ text lang.aboutRecord.sixth ]
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ id "sponsors", class "sponsors-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "sponsors-title" ] ]
                [ text lang.sponsors ]
            , Grid.col [ Col.xs12, Col.attrs [ class "sponsors-logos" ] ]
                [ img [ src "src/assets/public/logo_dr_cichiobieg.jpeg" ] []
                , img [ src "src/assets/public/logo_primavika.jpg" ] []
                , img [ src "src/assets/public/logo_unimil.png" ] []
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ id "registration", class "registration-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "registration-title" ] ]
                [ text lang.registrationNote ]
            , Grid.col [ Col.xs12, Col.attrs [ class "registration-date" ] ]
                [ text "03.11.2019" ]
            , Grid.col [ Col.xs12, Col.attrs [ class "registration-button" ] ]
                [ a
                    [ href <| registrationUrl lang
                    , target "_blank"
                    , class "btn btn-dark"
                    ]
                    [ text <| String.toUpper lang.registration ]
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ id "regulations", class "regulations-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "regulations-title" ] ]
                [ text lang.regulations ]
            , Grid.col [ Col.xs12, Col.attrs [ class "regulations-button" ] ]
                [ a
                    [ href <| rulesUrl lang
                    , target "_blank"
                    , class "btn btn-dark"
                    ]
                    [ text <| String.toUpper lang.read ]
                ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ id "contact", class "contact-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "contact-title" ] ]
                [ text lang.contact ]
            , Grid.col [ Col.xs12, Col.attrs [ class "contact-email" ] ]
                [ text "shameless@gumed.edu.pl" ]
            , Grid.col [ Col.xs12, Col.attrs [ class "contact-facebook" ] ]
                [ a
                    [ href "https://www.facebook.com/Shameless-Gda%C5%84sk-Studencka-Konferencja-Urologiczno-Dermatologiczna-105801244136649"
                    , target "_blank"
                    , class "btn btn-dark"
                    ]
                    [ text "Facebook" ]
                ]
            ]
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


programmeUrl : String
programmeUrl =
    "https://shameless.gumed.edu.pl/src/assets/public/programme.pdf"


registrationUrl : Language -> String
registrationUrl lang =
    case lang.language of
        EN ->
            "https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__iVtKxtUMkk4MzUzTjAwRzBESDlQUU04UzNINTdGUS4u"

        PL ->
            "https://forms.office.com/Pages/ResponsePage.aspx?id=DQSIkWdsW0yxEjajBLZtrQAAAAAAAAAAAAN__iVtKxtUNjlHSDdLWEJGMjNWVE40S1BEUjlJTjVRTC4u"


rulesUrl : Language -> String
rulesUrl lang =
    case lang.language of
        EN ->
            "https://shameless.gumed.edu.pl/src/assets/public/rules-ang.pdf"

        PL ->
            "https://shameless.gumed.edu.pl/src/assets/public/rules-pl.pdf"


englishLang : Language
englishLang =
    { language = EN
    , about = "About conference"
    , sponsors = "Sponsors"
    , registration = "Registration"
    , contact = "Contact"
    , organizers = "Organizators"
    , patronats = "Honorary Patronage"
    , longNote =
        { first = "Let's meet to talk about sexually transmitted diseases."
        , second = "Stop being ashamed to ask questions!"
        , third = "Get education, share knowledge and take care of your health."
        , fourth = "Do it for yourself, do it for the people you care about."
        , fifth = "Prevent what can be prevented."
        }
    , programme = "Programme"
    , aboutRecord =
        { first = "Interdisciplinary cooperation between dermatologists and urologists"
        , second = "Sexually transmitted diseases - education and prevention"
        , third = "November - month of testical and prostate cancer awareness"
        , fourth = "Dermatological signs of STDs"
        , fifth = "Prostate cancer through the eyes of a biotechnologist"
        , sixth = "STD on the Internet - is it easier to talk annonymously"
        }
    , registrationNote = "REGISTER TO SHAMELESS GDAŃSK BY"
    , regulations = "RULES AND REGULATIONS"
    , read = "READ"
    }


polishLang : Language
polishLang =
    { language = PL
    , about = "O konferencji"
    , sponsors = "Sponsorzy"
    , registration = "Rejestracja"
    , contact = "Kontakt"
    , organizers = "Organizatorzy"
    , patronats = "Patronaty Honorowe"
    , longNote =
        { first = "Spotkajmy się, aby porozmawiać o chorobach przenoszonych drogą płciową."
        , second = "Przestańmy się wstydzić, zacznijmy zadawać pytania!"
        , third = "Uczmy się, dzielmy się wiedzą z innymi i dbajmy o nasze zdrowie."
        , fourth = "Zróbmy to dla siebie i naszych najbliższych."
        , fifth = "Zabezpieczaj się, by zapobiegać."
        }
    , programme = "Program"
    , aboutRecord =
        { first = "Interdyscyplinarna współpraca między urologami a dermatologami"
        , second = "Choroby przenoszone drogą płciową: edukacja i profilaktyka"
        , third = "Profilaktyka nowotworów męskich - jąder i prostaty"
        , fourth = "Skórne objawy chorób przenoszonych drogą płciową"
        , fifth = "Rak prostaty okiem biotechnologa"
        , sixth = "Dzielenie się wiedzą na temat chorób przenoszonych drogą płciową w Internecie"
        }
    , registrationNote = "REJESTRACJA NA SHAMELESS GDAŃSK TRWA DO"
    , regulations = "REGULAMIN SESJI KONKURSOWEJ"
    , read = "PRZECZYTAJ"
    }
