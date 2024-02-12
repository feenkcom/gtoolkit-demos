Class {
	#name : #GtTMoneyExamples,
	#superclass : #Object,
	#category : #'GToolkit-Tutorial-Prices-Examples'
}

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollars [
	<gtExample>
	| bag |
	bag := self fourtyTwoEuros + self fourtyTwoDollars.
	self assert: (bag isKindOf: GtTMoneyBag).
	self assert: (bag monies size = 2).
	^ bag
]

{ #category : #examples }
GtTMoneyExamples >> bagWithEurosAndDollarsMinusEuros [
	<gtExample>
	| money |
	money := self bagWithEurosAndDollars - self fourtyTwoEuros.
	self assert: (money isKindOf: GtTCurrencyMoney).
	self assert: (money = self fourtyTwoDollars).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> derivedZeroEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: (money * 0) isZero.
	self assert: (money - 42 euros) isZero.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoDollars [
	<gtExample>
	| money |
	money := 42 usd.
	self assert: money isZero not.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoDollarsPlusZeroDollars [
	<gtExample>
	| money |
	money := self fourtyTwoDollars + self zeroEuros.
	self assert: money = 42 usd.
	self assert: (money isKindOf: GtTCurrencyMoney).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEuros [
	<gtExample>
	| money |
	money := 42 euros.
	self assert: money isZero not.
	self assert: money = 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosDividedByTwo [
	<gtExample>
	| money |
	money := self fourtyTwoEuros / 2.
	self assert: money = 21 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosDividedByTwoEuros [
	<gtExample>
	| money |
	money := 42 euros.
	self assert: (money / 2 euros) = 21.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosHigherThanZeroEuros [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosHigherThanZeroMoney [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosMultipledByTwo [
	<gtExample>
	| money |
	money := self fourtyTwoEuros * 3.
	self assert: money = 126 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self fourtyTwoEuros.
	self assert: money = 84 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosPlusFourtyTwoEurosMinusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self fourtyTwoEuros - self fourtyTwoEuros.
	self assert: money = 42 euros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> fourtyTwoEurosPlusZeroMoney [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self zeroMoney.
	self assert: money = self fourtyTwoEuros.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> higherThan [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: self fourtyTwoEuros + self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> lessThan [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEuros [
	<gtExample>
	| money |
	money := 0 euros.
	self assert: money isZero.
	self assert: money = self zeroMoney.
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosLessThanPositive [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroEuros + self fourtyTwoEuros.
	self assert: money = self fourtyTwoEuros.
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
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtTMoneyExamples >> zeroMoneyPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroMoney + self fourtyTwoEuros.
	self assert: money = self fourtyTwoEuros.
	^ money
]
