Object subclass: #GtTPrice
  | price |
  price := 100 euros asPrice.
  self assert: price = 100 euros asPrice.! !