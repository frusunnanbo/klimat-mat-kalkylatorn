module Main exposing (..)

import Browser
import Html exposing (Html, Attribute, h1, div, input, text, table, tr, td)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Foods


-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { content : String
    , foods : List Foods.Food
    }


init : Model
init =
    { content = ""
    , foods = Foods.foods
   }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent, foods = filterFoods newContent }

filterFoods : String -> List Foods.Food
filterFoods userInput =
  List.filter (foodNameContains userInput) Foods.foods

foodNameContains : String -> Foods.Food -> Bool
foodNameContains userInput food =
  String.contains (String.toLower userInput) (String.toLower food.name)


-- VIEW


view : Model -> Html Msg
view model =
  div []
      [ h1 [] [ text "Mata in mat" ]
        , div
        []
        [ input [ placeholder "Mata in mat", value model.content, onInput Change ] []
        , div [] [ foods model.foods ]
        ]
        ]

foods : List Foods.Food -> Html Msg
foods foodList =
  table [] (List.map foodRow foodList)

foodRow : Foods.Food -> Html Msg
foodRow  food =
  tr []
    [ td [] [ text food.name ]
    , td [] [ text (formatCo2Equivivalents food.co2equivalents) ]
    ]

formatCo2Equivivalents : Float -> String
formatCo2Equivivalents co2equivalents =
  String.fromFloat co2equivalents ++ " kg CO2"
