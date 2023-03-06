Class {
	#name : #SPLDeclaration,
	#superclass : #SPLNode,
	#instVars : [
		'variable'
	],
	#category : #'GToolkit-Demo-SPL-Interpreter'
}

{ #category : #'instance creation' }
SPLDeclaration class >> for: aVariable [
	^ self new
		variable: aVariable;
		yourself
]

{ #category : #printing }
SPLDeclaration >> printOn: aStream [
	aStream
		nextPutAll: 'var ';
		print: self variable;
		nextPut: $;
]

{ #category : #stepping }
SPLDeclaration >> stepIn: aContext [
	aContext environment declareVariable: self variable.
	^ SPLExpressionStatement for: SPLNil new
]

{ #category : #accessing }
SPLDeclaration >> variable [
	^ variable
]

{ #category : #acccessing }
SPLDeclaration >> variable: aVariable [
	variable := aVariable
]
