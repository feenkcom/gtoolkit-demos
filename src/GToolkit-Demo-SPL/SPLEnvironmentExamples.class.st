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
SPLEnvironmentExamples >> envtWithVarX [
	"This test hangs with the last assertion."

	<gtExample>
	| envt |
	envt := self emptyEnvironment.
	envt declareVariable: self varX.
	self assert: envt isEmpty not.
	self assert: envt variables size equals: 1.
	self assert: (envt getVariable: self varX) name equals: 'x'.
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
