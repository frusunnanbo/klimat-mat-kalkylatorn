module Main exposing (..)

import Dict exposing (Dict)

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
    , amounts : Dict String Float
    }


init : Model
init =
    { content = ""
    , foods = Foods.foods
    , amounts = Dict.empty
   }



-- UPDATE


type Msg
    = Change String
    | NewAmount String Float


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newContent ->
            { model | content = newContent, foods = filterFoods newContent }
        NewAmount foodName amount ->
            { model | amounts = Dict.insert foodName amount model.amounts }

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
        , div [] [ foods model.foods model.amounts ]
        , div [] [ text ("Summa: " ++ (String.fromFloat (sumCO2 model.amounts)) ++ " kg C02-ekvivalenter") ]
        ]
        ]

foods : List Foods.Food -> Dict String Float -> Html Msg
foods foodList amounts =
  table [] (List.map (foodRow amounts) foodList)

foodRow : Dict String Float -> Foods.Food -> Html Msg
foodRow  amounts food =
  tr []
    [ td [] [ text food.name ]
    , td [] [ input [ placeholder "kg mat", value (getAmount food.name amounts), onInput (newAmount food.name) ] [] ]
    , td [] [ text (formatCo2Equivivalents food.co2equivalents) ]
    ]

getAmount : String -> Dict String Float -> String
getAmount foodName amounts =
  Dict.get foodName amounts
  |> Maybe.map String.fromFloat
  |> Maybe.withDefault ""

newAmount : String -> String -> Msg
newAmount foodName amount =
  NewAmount foodName (Maybe.withDefault 0 (String.toFloat amount))

formatCo2Equivivalents : Float -> String
formatCo2Equivivalents co2equivalents =
  String.fromFloat co2equivalents ++ " kg CO2"

sumCO2 : Dict String Float -> Float
sumCO2 amounts =
  Dict.foldl addFoodAmount 0 amounts

addFoodAmount : String -> Float -> Float -> Float
addFoodAmount foodName amount accumulated =
  accumulated + (Foods.getC02equivalent foodName amount)
