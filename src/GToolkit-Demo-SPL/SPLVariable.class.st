Class {
	#name : #SPLVariable,
	#superclass : #SPLExpression,
	#instVars : [
		'name'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLVariable class >> named: aVariableName [
	^ self new
		name: aVariableName;
		yourself
]

{ #category : #comparing }
SPLVariable >> = anObject [
	"Answer whether the receiver and anObject represent the same object.
	This is needed to use SPL variables as keys in the Environment dictionary."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self name = anObject name
]

{ #category : #comparing }
SPLVariable >> hash [
	^ self name hash
]

{ #category : #testing }
SPLVariable >> isSPLVariable [
	^ true
]

{ #category : #accessing }
SPLVariable >> name [
	^ name
]

{ #category : #accessing }
SPLVariable >> name: aVariableName [
	name := aVariableName
]

{ #category : #accessing }
SPLVariable >> printOn: aStream [
	aStream nextPutAll: self name
]

{ #category : #stepping }
SPLVariable >> stepInContext: aContext [
	^ aContext environment getVariable: self
]

{ #category : #accessing }
SPLVariable >> value [
	^ name
]
