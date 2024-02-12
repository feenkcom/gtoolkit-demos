Class {
	#name : #GtDMoneyExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices-Examples'
}

{ #category : #examples }
GtDMoneyExamples >> bagWithEurosAndDollars [
	<gtExample>
	| bag |
	bag := self fourtyTwoEuros + self fourtyTwoDollars.
	self assert: (bag isKindOf: GtDMoneyBag).
	self assert: (bag monies size = 2).
	^ bag
]

{ #category : #examples }
GtDMoneyExamples >> bagWithEurosAndDollarsMinusEuros [
	<gtExample>
	| money |
	money := self bagWithEurosAndDollars - self fourtyTwoEuros.
	self assert: (money isKindOf: GtDCurrencyMoney).
	self assert: (money = self fourtyTwoDollars).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> derivedZeroEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: (money * 0) isZero.
	self assert: (money - 42 gtEUR) isZero.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoDollars [
	<gtExample>
	| money |
	money := 42 gtUSD.
	self assert: money isZero not.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoDollarsPlusZeroDollars [
	<gtExample>
	| money |
	money := self fourtyTwoDollars + self zeroEuros.
	self assert: money = 42 gtUSD.
	self assert: (money isKindOf: GtDCurrencyMoney).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEuros [
	<gtExample>
	| money |
	money := 42 gtEUR.
	self assert: money isZero not.
	self assert: money = 42 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosDividedByTwo [
	<gtExample>
	| money |
	money := self fourtyTwoEuros / 2.
	self assert: money = 21 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosDividedByTwoEuros [
	<gtExample>
	| money |
	money := 42 gtEUR.
	self assert: (money / 2 gtEUR) = 21.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosHigherThanZeroEuros [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosHigherThanZeroMoney [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosMultipledByTwo [
	<gtExample>
	| money |
	money := self fourtyTwoEuros * 3.
	self assert: money = 126 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self fourtyTwoEuros.
	self assert: money = 84 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosPlusFourtyTwoEurosMinusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self fourtyTwoEuros - self fourtyTwoEuros.
	self assert: money = 42 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fourtyTwoEurosPlusZeroMoney [
	<gtExample>
	| money |
	money := self fourtyTwoEuros + self zeroMoney.
	self assert: money = self fourtyTwoEuros.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> higherThan [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: self fourtyTwoEuros + self fourtyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> lessThan [
	<gtExample>
	| money |
	money := self fourtyTwoEuros.
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroEuros [
	<gtExample>
	| money |
	money := 0 gtEUR.
	self assert: money isZero.
	self assert: money = self zeroMoney.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroEurosLessThanPositive [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroEuros + self fourtyTwoEuros.
	self assert: money = self fourtyTwoEuros.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroMoney [
	<gtExample>
	^ GtDZeroMoney new
]

{ #category : #examples }
GtDMoneyExamples >> zeroMoneyLessThanPositive [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: money < (self fourtyTwoEuros + self fourtyTwoEuros).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroMoneyPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroMoney + self fourtyTwoEuros.
	self assert: money = self fourtyTwoEuros.
	^ money
]
