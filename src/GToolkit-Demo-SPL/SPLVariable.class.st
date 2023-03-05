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

{ #category : #accessing }
SPLVariable >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ self name = anObject name
]

{ #category : #accessing }
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
SPLVariable >> stepIn: aContext [
	^ aContext environment getVariable: self
]

{ #category : #accessing }
SPLVariable >> value [
	^ name
]

{ #category : #accessing }
SPLVariable >> variable [
	self
		deprecated: 'Use name'
		transformWith: '`@receiver variable' -> '`@receiver name'.
	^ name
]

{ #category : #accessing }
SPLVariable >> variable: aVariableName [
	self
		deprecated: 'Use name:'
		transformWith: '`@receiver variable:' -> '`@receiver name:'.
	name := aVariableName
]
