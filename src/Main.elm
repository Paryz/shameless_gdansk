module Main exposing (LangType(..), Language, Model, Msg(..), englishLang, main, polishLang, rulesUrl, update, view)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Grid.Row as Row
import Browser
import Html exposing (Html, a, br, div, h1, img, nav, p, source, strong, text, video)
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
    , mediaPatrons : String
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
    Grid.containerFluid [ class "main-container" ]
        [ Grid.row [ Row.centerMd, Row.attrs [ class "video-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "video-wrapper-column" ] ]
                [ img [ src "src/assets/public/tlo.png" ] [] ]
            ]
        , Grid.row [ Row.centerMd, Row.attrs [ class "registration-wrapper" ] ]
            [ Grid.col [ Col.xs12, Col.attrs [ class "registration-date" ] ]
                [ text "28.11.2020"
                , br [] []
                , text "5 SHADES OF HPV"
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
                , img [ src "src/assets/public/logo_skn_uro.png", class "skn-uro-logo" ] []
                ]
            , Grid.col [ Col.xs12, Col.attrs [ class "organizers-logos-smaller" ] ]
                [ img [ src "src/assets/public/logo_ebu.png" ] []
                , img [ src "src/assets/public/logo_kliniki_uro.png" ] []
                ]
            , Grid.col
                [ Col.xs12, Col.attrs [ class "patronats" ] ]
                [ text lang.patronats ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_pathronage.png" ] [] ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_ptu_small.jpg" ] [] ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_prezydent.jpg" ] [] ]
            , Grid.col [ Col.xs6, Col.sm6, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_uss.png", class "left" ] [] ]
            , Grid.col [ Col.xs6, Col.sm6, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_ptd.jpeg", class "right" ] [] ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_oil.png" ] [] ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_uck.png" ] [] ]
            , Grid.col [ Col.xs6, Col.sm4, Col.attrs [ class "patronats-logos" ] ]
                [ img [ src "src/assets/public/logo_movember.png" ] [] ]
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


rulesUrl : Language -> String
rulesUrl lang =
    case lang.language of
        EN ->
            "https://onedrive.live.com/?authkey=%21AC6n4%5FJVJaHRxCI&cid=8832C8A0986525C7&id=8832C8A0986525C7%21156&parId=8832C8A0986525C7%21155&o=OneUp"

        PL ->
            "https://onedrive.live.com/?authkey=%21AC6n4%5FJVJaHRxCI&cid=8832C8A0986525C7&id=8832C8A0986525C7%21156&parId=8832C8A0986525C7%21155&o=OneUp"


englishLang : Language
englishLang =
    { language = EN
    , about = "About conference"
    , sponsors = "Sponsors"
    , mediaPatrons = "Media Patronage"
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
    , regulations = "RULES AND REGULATIONS"
    , read = "READ"
    }


polishLang : Language
polishLang =
    { language = PL
    , about = "O konferencji"
    , sponsors = "Sponsorzy"
    , mediaPatrons = "Patronaty Medialne"
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
    , regulations = "REGULAMIN SESJI KONKURSOWEJ"
    , read = "PRZECZYTAJ"
    }
