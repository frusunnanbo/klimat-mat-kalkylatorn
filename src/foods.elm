module Foods exposing (Food, foods)

type alias Food =
  { name : String
  , co2equivalents : Float
  }

foods =
  [ { name = "Nötkött", co2equivalents = 31.0 }
  , { name = "Lammkött", co2equivalents = 27.0 }
  , { name = "Ost", co2equivalents = 14.0 }
  , { name = "Griskött", co2equivalents = 7.0 }
  , { name = "Fisk", co2equivalents = 6.0 }
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
