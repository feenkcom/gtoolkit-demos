Class {
	#name : #GtDPriceExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices-Examples'
}

{ #category : #examples }
GtDPriceExamples >> concretePrice [
	<gtExample>
	<return: #GtDConcretePrice>
	| price |
	price := 100 gtEUR asPrice.
	self assert: price = 100 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByMoney [
	<gtExample>
	<return: #GtDPriceDiscountedByMoney>
	| price discountedPrice |
	price := self concretePrice.
	discountedPrice := price discountedBy: 10 gtEUR.
	self assert: discountedPrice = 90 gtEUR asPrice.
	^ discountedPrice
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	<return: #GtDPriceDiscountedByPercentage>
	| price discountedPrice |
	price := self concretePriceDiscountedByMoney.
	discountedPrice := price discountedBy: 10 percent.
	self assert: discountedPrice = 81 gtEUR asPrice.
	^ discountedPrice
]

{ #category : #examples }
GtDPriceExamples >> concretePriceDiscountedByPercentage [
	<gtExample>
	<return: #GtDPriceDiscountedByPercentage>
	| price |
	price := GtDPriceDiscountedByPercentage new
			price: self concretePrice;
			discountPercentage: 10 percent.
	self assert: price money = 90 gtEUR.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> concretePriceUSD [
	<gtExample>
	<return: #GtDConcretePrice>
	| price |
	price := 100 gtUSD asPrice.
	self assert: price money equals: 100 gtUSD.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> displayOfConcretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	<return: #GtDPriceDiscountedByPercentage>
	| price |
	price := self concretePriceDiscountedByMoneyAndDiscountedByPercentage.
	self assert: price gtDisplayString = '81 EUR = 10% off (10 EUR off 100 EUR)'.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> displayOfDividedPrices [
	<gtExample>
	<return: #GtDPriceExamples>
	| price |
	price := 20 gtEUR asPrice / 2 / 2.
	self assert: price gtDisplayString = '5 EUR = (20 EUR / 2) / 2'
]

{ #category : #examples }
GtDPriceExamples >> displayOfMultipliedPrices [
	<gtExample>
	<return: #GtDPriceExamples>
	| price |
	price := 20 gtEUR asPrice * 2 * 2.
	self assert: price gtDisplayString = '80 EUR = (20 EUR * 2) * 2'
]

{ #category : #examples }
GtDPriceExamples >> displayOfMultiplySummedPrices [
	<gtExample>
	<return: #GtDPriceExamples>
	| price |
	price := 10 gtEUR asPrice + 20 gtEUR asPrice + 30 gtEUR asPrice.
	self assert: price gtDisplayString = '60 EUR = (10 EUR + 20 EUR) + 30 EUR'
]

{ #category : #examples }
GtDPriceExamples >> dividedPrice [
	<gtExample>
	<return: #GtDDividedPrice>
	| price |
	price := self concretePrice / 2.
	self assert: price = 50 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> fortyTwoEurosDividedByTwoEuros [
	<gtExample>
	<return: #GtDConcretePrice>
	| price |
	price := 42 gtEUR asPrice.
	self assert: price / 2 = 21 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> fortyTwoEurosLessThanHundredEuros [
	<gtExample>
	<return: #GtDConcretePrice>
	| price |
	price := 100 gtEUR asPrice.
	self assert: 42 gtEUR asPrice < price.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> hundredEurosHigherThanFourtyTwoEuros [
	<gtExample>
	<return: #GtDConcretePrice>
	| price |
	price := 100 gtEUR asPrice.
	self assert: price > 42 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> multipliedPrice [
	<gtExample>
	<return: #GtDMultipliedPrice>
	| price |
	price := self concretePrice * 2.
	self assert: price = 200 gtEUR asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> multipliedPriceInDifferentCurrencies [
	<gtExample>
	<return: #GtDMultipliedPrice>
	| price |
	price := self summedPriceInDifferentCurrencies * 2.
	self assert: price = (200 gtEUR + 40 gtUSD) asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> sumOfConcretePriceDiscountedByMoneyAndDiscountedByPercentage [
	<gtExample>
	<return: #GtDSummedPrice>
	| price totalPrice |
	price := self concretePriceDiscountedByMoneyAndDiscountedByPercentage.
	totalPrice := price + 10 gtEUR asPrice.
	self assert: totalPrice = 91 gtEUR asPrice.
	^ totalPrice
]

{ #category : #examples }
GtDPriceExamples >> summedPriceInDifferentCurrencies [
	<gtExample>
	<return: #GtDSummedPrice>
	| price |
	price := 100 gtEUR asPrice + 20 gtUSD asPrice.
	self assert: price = (100 gtEUR + 20 gtUSD) asPrice.
	^ price
]

{ #category : #examples }
GtDPriceExamples >> summedPriceInTheSameCurrency [
	<gtExample>
	<return: #GtDSummedPrice>
	| price |
	price := 100 gtEUR asPrice + 20 gtEUR asPrice.
	self assert: price = 120 gtEUR asPrice.
	^ price
]
