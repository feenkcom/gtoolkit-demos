Class {
	#name : #GtTMoneyExamples,
	#superclass : #Object,
	#category : #'GToolkit-Tutorial-Prices-Examples'
}

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollars [
	<gtExample>
	| bag |
	bag := self fortyTwoEuros + self fortyTwoDollars.
	self assert: (bag isKindOf: GtTMoneyBag).
	self assert: bag monies size equals: 2.
	^ bag
]

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollarsMinusEuros [
	<gtExample>
	| money |
	money := self bagWithEurosAndDollars - self fortyTwoEuros.
	self assert: (money isKindOf: GtTCurrencyMoney).
	self assert: money equals: self fortyTwoDollars.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> derivedZeroEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: (money * 0) isZero.
	self assert: (money - 42 euros) isZero.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoDollars [
	<gtExample>
	| money |
	money := 42 usd.
	self assert: money isZero not.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoDollarsPlusZeroEuros [
	<gtExample>
	| money |
	money := self fortyTwoDollars + self zeroEuros.
	self assert: money equals: 42 usd.
	self assert: (money isKindOf: GtTCurrencyMoney).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEuros [
	<gtExample>
	| money |
	money := 42 euros.
	self assert: money isZero not.
	self assert: money equals: 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosDividedByTwo [
	<gtExample>
	| money |
	money := self fortyTwoEuros / 2.
	self assert: money equals: 21 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosDividedByTwoEuros [
	<gtExample>
	| money |
	money := 42 euros.
	self assert: money / 2 euros equals: 21.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosHigherThanZeroEuros [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosHigherThanZeroMoney [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosMultipledByTwo [
	<gtExample>
	| money |
	money := self fortyTwoEuros * 3.
	self assert: money equals: 126 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros.
	self assert: money equals: 84 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusFourtyTwoEurosMinusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros - self fortyTwoEuros.
	self assert: money equals: 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fortyTwoEurosPlusZeroMoney [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self zeroMoney.
	self assert: money equals: self fortyTwoEuros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> higherThan [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: self fortyTwoEuros + self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> lessThan [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEuros [
	<gtExample>
	| money |
	money := 0 euros.
	self assert: money isZero.
	self assert: money equals: self zeroMoney.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosLessThanPositive [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroEuros + self fortyTwoEuros.
	self assert: money equals: self fortyTwoEuros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoney [
	<gtExample>
	^ GtTZeroMoney new
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoneyLessThanPositive [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoneyPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroMoney + self fortyTwoEuros.
	self assert: money equals: self fortyTwoEuros.
	^ money
]
