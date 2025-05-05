Class {
	#name : #GtTMoneyExamples,
	#superclass : #Object,
	#category : #'GToolkit-Tutorial-Prices-Examples'
}

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollars [
	<gtExample>
	<return: #GtTMoneyBag>
	| bag |
	bag := self fortyTwoEuros + self fortyTwoDollars.
	self assert: (bag isKindOf: GtTMoneyBag).
	self assert: bag monies size equals: 2.
	^ bag
]

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollarsMinusEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self bagWithEurosAndDollars - self fortyTwoEuros.
	self assert: (money isKindOf: GtTCurrencyMoney).
	self assert: money equals: self fortyTwoDollars.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> derivedZeroEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros.
	self assert: (money * 0) isZero.
	self assert: (money - 42 euros) isZero.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoDollars [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := 42 usd.
	self assert: money isZero not.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoDollarsPlusZeroEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoDollars + self zeroEuros.
	self assert: money equals: 42 usd.
	self assert: (money isKindOf: GtTCurrencyMoney).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := 42 euros.
	self assert: money isZero not.
	self assert: money equals: 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosDividedByTwo [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros / 2.
	self assert: money equals: 21 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosDividedByTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := 42 euros.
	self assert: money / 2 euros equals: 21.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosHigherThanZeroEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self zeroEuros.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosHigherThanZeroMoney [
	<gtExample>
	<return: #GtTZeroMoney>
	| money |
	money := self zeroMoney.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosMultipledByTwo [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros * 3.
	self assert: money equals: 126 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusFourtyTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros.
	self assert: money equals: 84 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusFourtyTwoEurosMinusFourtyTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros - self fortyTwoEuros.
	self assert: money equals: 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusZeroMoney [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros + self zeroMoney.
	self assert: money equals: self fortyTwoEuros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> higherThan [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros.
	self assert: self fortyTwoEuros + self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> lessThan [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self fortyTwoEuros.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := 0 euros.
	self assert: money isZero.
	self assert: money equals: self zeroMoney.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosLessThanPositive [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self zeroEuros.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosPlusFourtyTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self zeroEuros + self fortyTwoEuros.
	self assert: money equals: self fortyTwoEuros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoney [
	<gtExample>
	<return: #GtTZeroMoney>
	^ GtTZeroMoney new
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoneyLessThanPositive [
	<gtExample>
	<return: #GtTZeroMoney>
	| money |
	money := self zeroMoney.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoneyPlusFourtyTwoEuros [
	<gtExample>
	<return: #GtTCurrencyMoney>
	| money |
	money := self zeroMoney + self fortyTwoEuros.
	self assert: money equals: self fortyTwoEuros.
	^ money
]
