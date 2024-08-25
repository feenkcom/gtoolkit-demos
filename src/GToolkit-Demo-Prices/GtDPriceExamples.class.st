Class {
	#name : #GtDPriceExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices-Examples'
}

{ #category : #examples }
GtDPriceExamples >> concretePrice [
	<gtExample>
	| price |
	price := 100 gtEUR asPrice.
	self assert: price = 100 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByMoney [
	<gtExample>
	| price discountedPrice |
	price := self concretePrice.
	discountedPrice := price discountedBy: 10 gtEUR.
	self assert: discountedPrice = 90 gtEUR asPrice.
	^ discountedPrice
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	| price discountedPrice |
	price := self concretePriceDiscountedByMoney.
	discountedPrice := price discountedBy: 10 percent. 
	self assert: discountedPrice = 81 gtEUR asPrice.
	^ discountedPrice
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByPercentage [
	<gtExample>
	| price |
	price := GtDPriceDiscountedByPercentage new price: self concretePrice; discountPercentage: 10 percent.
	self assert: price money = 90 gtEUR.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> concretePriceUSD [
	<gtExample>
	| price |
	price := 100 gtUSD asPrice.
	self assert: price money equals: 100 gtUSD.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> displayOfConcretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	| price |
	price := self concretePriceDiscountedByMoneyAndDiscountedByPercentage.
	self assert: (price gtDisplayString = '81 EUR = 10% off (10 EUR off 100 EUR)').
	^ price
]

{ #category : #examples }
GtDPriceExamples >> displayOfDividedPrices [
	<gtExample>
	| price |
	price := (20 gtEUR asPrice / 2) / 2.
	self assert: (price gtDisplayString = '5 EUR = (20 EUR / 2) / 2')
]

{ #category : #examples }
GtDPriceExamples >> displayOfMultipliedPrices [
	<gtExample>
	| price |
	price := (20 gtEUR asPrice * 2) * 2.
	self assert: (price gtDisplayString = '80 EUR = (20 EUR * 2) * 2')
]

{ #category : #examples }
GtDPriceExamples >> displayOfMultiplySummedPrices [
	<gtExample>
	| price |
	price := 10 gtEUR asPrice + 20 gtEUR asPrice + 30 gtEUR asPrice.
	self assert: (price gtDisplayString = '60 EUR = (10 EUR + 20 EUR) + 30 EUR')
]

{ #category : #examples }
GtDPriceExamples >> dividedPrice [
	<gtExample>
	| price |
	price := self concretePrice / 2.
	self assert: price = 50 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> fortyTwoEurosDividedByTwoEuros [
	<gtExample>
	| price |
	price := 42 gtEUR asPrice.
	self assert: price / 2 = 21 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> fortyTwoEurosLessThanHundredEuros [
	<gtExample>
	| price |
	price := 100 gtEUR asPrice.
	self assert: 42 gtEUR asPrice < price.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> hundredEurosHigherThanFourtyTwoEuros [
	<gtExample>
	| price |
	price := 100 gtEUR asPrice.
	self assert: price > 42 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> multipliedPrice [
	<gtExample>
	| price |
	price := self concretePrice * 2.
	self assert: price = 200 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> multipliedPriceInDifferentCurrencies [
	<gtExample>
	| price |
	price := self summedPriceInDifferentCurrencies * 2.
	self assert: price = (200 gtEUR + 40 gtUSD) asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> sumOfConcretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	| price totalPrice |
	price := self concretePriceDiscountedByMoneyAndDiscountedByPercentage.
	totalPrice := price + 10 gtEUR asPrice.
	self assert: totalPrice = 91 gtEUR asPrice.
	^ totalPrice
]

{ #category : #examples }
GtDPriceExamples >> summedPriceInDifferentCurrencies [
	<gtExample>
	| price |
	price := 100 gtEUR asPrice + 20 gtUSD asPrice.
	self assert: price = (100 gtEUR + 20 gtUSD) asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> summedPriceInTheSameCurrency [
	<gtExample>
	| price |
	price := 100 gtEUR asPrice + 20 gtEUR asPrice.
	self assert: price = 120 gtEUR asPrice.
	^ price
]
