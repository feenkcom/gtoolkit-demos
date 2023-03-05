Class {
	#name : #SPLVariable,
	#superclass : #SPLExpression,
	#instVars : [
		'variable'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLVariable class >> for: aVariableName [
	^ self new
		variable: aVariableName;
		yourself
]

{ #category : #accessing }
SPLVariable >> printOn: aStream [
	aStream nextPutAll: self variable
]

{ #category : #stepping }
SPLVariable >> stepIn: aContext [
	^ aContext environment at: self variable
]

{ #category : #accessing }
SPLVariable >> value [
	^ variable
]

{ #category : #accessing }
SPLVariable >> variable [
	^ variable
]

{ #category : #accessing }
SPLVariable >> variable: aVariableName [
	variable := aVariableName
]