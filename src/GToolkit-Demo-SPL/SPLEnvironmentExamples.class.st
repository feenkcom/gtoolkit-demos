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
	<gtExample>
	| envt |
	envt := self emptyEnvironment.
	self assert: envt isEmpty.
	^ envt
]

{ #category : #example }
SPLEnvironmentExamples >> varX [
	<gtExample>
	| var |
	var := self emptyEnvironment.
	self assert: var isEmpty.
	^ var
]
