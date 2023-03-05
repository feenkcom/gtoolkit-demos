Class {
	#name : #SPLEnvironmentExamples,
	#superclass : #Object,
	#category : #'GToolkit-Demo-SPL-Examples'
}

{ #category : #example }
SPLEnvironmentExamples >> emptyEnvironment [
	<gtExample>
	| envt |
	envt := SPLEnvironment new.
	self assert: envt isEmpty.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> envtWithInitializedVarXupdatedTo7 [
	<gtExample>
	| envt |
	envt := self envtWithVarXinitializedTo42.
	envt setVariable: self varX to: (SPLNumber for: 42).
	self assert: envt isEmpty not.
	self assert: envt variables size equals: 1.
	self assert: (envt getVariableNamed: 'x') value equals: 42.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> envtWithVarX [
	<gtExample>
	| envt |
	envt := self emptyEnvironment.
	envt declareVariable: self varX.
	self assert: envt isEmpty not.
	self assert: envt variables size equals: 1.
	self assert: (envt getVariable: self varX) isSPLNil.
	self assert: (envt getVariableNamed: 'x') isSPLNil.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> envtWithVarXinitializedTo42 [
	<gtExample>
	| envt |
	envt := self emptyEnvironment.
	envt declareVariable: self varX initializedTo: (SPLNumber for: 42).
	self assert: envt isEmpty not.
	self assert: envt variables size equals: 1.
	self assert: (envt getVariableNamed: 'x') value equals: 42.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> envtWithVarXupdatedTo42 [
	<gtExample>
	| envt |
	envt := self envtWithVarX.
	envt setVariable: self varX to: (SPLNumber for: 42).
	self assert: envt isEmpty not.
	self assert: envt variables size equals: 1.
	self assert: (envt getVariableNamed: 'x') value equals: 42.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> varX [
	<gtExample>
	| var |
	var := SPLVariable named: 'x'.
	self assert: var name equals: 'x'.
	^ var
]
