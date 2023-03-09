Class {
	#name : #SimpleExpressionParser,
	#superclass : #PP2CompositeNode,
	#instVars : [
		'dec',
		'add',
		'mul',
		'prim',
		'goal'
	],
	#category : #'GToolkit-Demo-PetitParser-PetitParser'
}

{ #category : #grammar }
SimpleExpressionParser >> add [
	^ (mul , $+ asPParser , add) / mul
]

{ #category : #grammar }
SimpleExpressionParser >> dec [
	^ #digit asPParser
]

{ #category : #grammar }
SimpleExpressionParser >> goal [
	^ add end
]

{ #category : #grammar }
SimpleExpressionParser >> mul [
	^ (prim , $* asPParser , mul) / prim
]

{ #category : #grammar }
SimpleExpressionParser >> prim [
	^ ($( asPParser , add , $) asPParser) / dec
]

{ #category : #accessing }
SimpleExpressionParser >> start [
	^ goal
]
