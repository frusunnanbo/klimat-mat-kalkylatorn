module Foods exposing (Food, foods, getC02equivalent)

import Dict exposing (Dict)

type alias Food =
  { name : String
  , co2equivalents : Float
  }

foodsDict =
  Dict.fromList
  [ ("Nötkött", Food "Nötkött" 31.0)
  , ( "Lammkött", Food "Lammkött" 27.0)
  , ( "Ost", Food "Ost" 14.0)
  , ( "Griskött", Food "Griskött" 7.0)
  , ( "Fisk", Food "Fisk" 6.0)
  , ( "Torskblock", Food "Torskblock" 1.3)
  , ( "Kyckling", Food "Kyckling" 4.0)
  , ( "Ägg", Food "Ägg" 2.0)
  , ( "Ris", Food "Ris" 2.0)
  , ( "Mjölk", Food "Mjölk" 1.4)
  , ( "Tomater", Food "Tomater" 1.5)
  , ( "Baljväxter", Food "Baljväxter" 0.8)
  , ( "Bananer", Food "Bananer" 0.9)
  , ( "Apelsiner", Food "Apelsiner" 0.9)
  , ( "Mjukt bröd", Food "Mjukt bröd" 0.8)
  , ( "Gurka", Food "Gurka" 0.7)
  , ( "Kål", Food "Kål" 0.4)
  , ( "Broccoli", Food "Broccoli" 0.4)
  ,  ( "Potatis", Food "Potatis" 0.3)
  ,  ( "Isbergssallad", Food "Isbergssallad" 0.3)
  ,  ( "Morötter", Food "Morötter" 0.2)
  ]

foods =
  [ { name = "Nötkött", co2equivalents = 31.0 }
  , { name = "Lammkött", co2equivalents = 27.0 }
  , { name = "Ost", co2equivalents = 14.0 }
  , { name = "Griskött", co2equivalents = 7.0 }
  , { name = "Fisk", co2equivalents = 6.0 }
  , { name = "Torskblock", co2equivalents = 1.3 }
  , { name = "Kyckling", co2equivalents = 4.0 }
  , { name = "Ägg", co2equivalents = 2.0 }
  , { name = "Ris", co2equivalents = 2.0 }
  , { name = "Mjölk", co2equivalents = 1.4 }
  , { name = "Tomater", co2equivalents = 1.5 }
  , { name = "Baljväxter", co2equivalents = 0.8 }
  , { name = "Bananer", co2equivalents = 0.9 }
  , { name = "Apelsiner", co2equivalents = 0.9 }
  , { name = "Mjukt bröd", co2equivalents = 0.8 }
  , { name = "Gurka", co2equivalents = 0.7 }
  , { name = "Kål", co2equivalents = 0.4 }
  , { name = "Broccoli", co2equivalents = 0.4 }
  ,  { name = "Potatis", co2equivalents = 0.3 }
  ,  { name = "Isbergssallad", co2equivalents = 0.3 }
  ,  { name = "Morötter", co2equivalents = 0.2 }
  ]

getC02equivalent : String -> Float -> Float
getC02equivalent foodName amount =
  amount * (Maybe.withDefault 0 (Maybe.map getC02 (Dict.get foodName foodsDict)))

getC02 : Food -> Float
getC02 food =
  food.co2equivalents
