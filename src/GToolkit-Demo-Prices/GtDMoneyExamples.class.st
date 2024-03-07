Class {
	#name : #GtDMoneyExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-Prices-Examples'
}

{ #category : #examples }
GtDMoneyExamples >> bagWithEurosAndDollars [
	<gtExample>
	| bag |
	bag := self fortyTwoEuros + self fortyTwoDollars.
	self assert: (bag isKindOf: GtDMoneyBag).
	self assert: (bag monies size = 2).
	^ bag
]

{ #category : #examples }
GtDMoneyExamples >> bagWithEurosAndDollarsMinusEuros [
	<gtExample>
	| money |
	money := self bagWithEurosAndDollars - self fortyTwoEuros.
	self assert: (money isKindOf: GtDCurrencyMoney).
	self assert: (money = self fortyTwoDollars).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> derivedZeroEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: (money * 0) isZero.
	self assert: (money - 42 gtEUR) isZero.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoDollars [
	<gtExample>
	| money |
	money := 42 gtUSD.
	self assert: money isZero not.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoDollarsPlusZeroDollars [
	<gtExample>
	| money |
	money := self fortyTwoDollars + self zeroEuros.
	self assert: money = 42 gtUSD.
	self assert: (money isKindOf: GtDCurrencyMoney).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEuros [
	<gtExample>
	| money |
	money := 42 gtEUR.
	self assert: money isZero not.
	self assert: money = 42 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosDividedByTwo [
	<gtExample>
	| money |
	money := self fortyTwoEuros / 2.
	self assert: money = 21 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosDividedByTwoEuros [
	<gtExample>
	| money |
	money := 42 gtEUR.
	self assert: (money / 2 gtEUR) = 21.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosHigherThanZeroEuros [
	<gtExample>
	| money |
	money := self zeroEuros.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosHigherThanZeroMoney [
	<gtExample>
	| money |
	money := self zeroMoney.
	self assert: self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosMultipledByTwo [
	<gtExample>
	| money |
	money := self fortyTwoEuros * 3.
	self assert: money = 126 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros.
	self assert: money = 84 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosPlusFourtyTwoEurosMinusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self fortyTwoEuros - self fortyTwoEuros.
	self assert: money = 42 gtEUR.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> fortyTwoEurosPlusZeroMoney [
	<gtExample>
	| money |
	money := self fortyTwoEuros + self zeroMoney.
	self assert: money = self fortyTwoEuros.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> higherThan [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: self fortyTwoEuros + self fortyTwoEuros > money.
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> lessThan [
	<gtExample>
	| money |
	money := self fortyTwoEuros.
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
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
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroEurosPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroEuros + self fortyTwoEuros.
	self assert: money = self fortyTwoEuros.
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
	self assert: money < (self fortyTwoEuros + self fortyTwoEuros).
	^ money
]

{ #category : #examples }
GtDMoneyExamples >> zeroMoneyPlusFourtyTwoEuros [
	<gtExample>
	| money |
	money := self zeroMoney + self fortyTwoEuros.
	self assert: money = self fortyTwoEuros.
	^ money
]
